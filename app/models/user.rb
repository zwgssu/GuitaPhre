class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, :recoverable, omniauth_providers: %i[twitter google_oauth2]

  validates :username, presence: true, length: { maximum: 50 }
  validates :introduction, length: { maximum: 200 }
  validate if: :new_profile_picture do
    if new_profile_picture.respond_to?(:content_type)
      unless new_profile_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_picture, :invalid_image_type)
      end
    else
      errors.add(:new_profile_picture, :invalid)
    end
  end

  before_save do
    if new_profile_picture
      self.profile_picture = new_profile_picture
    elsif remove_profile_picture
    self.profile_picture.purge
    end
  end

  has_one_attached :profile_picture
  attribute :new_profile_picture
  attribute :remove_profile_picture, :boolean

  #プロフィール編集でパスワード入力なしで編集完了ができるようにする
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  #SNS認証でログインした場合、ユーザー情報を登録する
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_manually_updated = true
    end
  end
    
  has_many :phrases, dependent: :destroy
  has_many :themes, dependent: :destroy
  has_many :favorite_users, dependent: :destroy
  has_many :liking_users, through: :favorite_users, source: :fav_user
  has_many :revers_of_favorite_users, class_name: "FavoriteUser", foreign_key: "fav_user_id"
  has_many :likers, through: :revers_of_favorite_users, source: :user
  has_many :favorite_phrases, dependent: :destroy
  has_many :liking_phrases, through: :favorite_phrases, source: :phrase
  has_many :comments, dependent: :destroy
  has_many :theme_comments, dependent: :destroy

  #fav関連
  def favorite_user(other_user)
    unless self == other_user
      self.favorite_users.find_or_create_by(fav_user_id: other_user.id)
    end
  end

  def favorite_phrase(other_phrase)
    self.favorite_phrases.find_or_create_by(phrase_id: other_phrase.id)
  end

  def unfavorite_user(other_user)
    fav = self.favorite_users.find_by(fav_user_id: other_user.id) 
    fav.destroy if fav
  end

  def unfavorite_phrase(other_phrase)
    fav = self.favorite_phrases.find_by(phrase_id: other_phrase.id)
    fav.destroy if fav
  end

  #favしているかの確認
  def liking_user?(other)
    self.liking_users.include?(other)
  end

  def liking_phrase?(other)
    self.liking_phrases.include?(other)
  end

  #マイページ用　自分のフレーズとfavユーザーのフレーズをまとめる
  def feed_phrases
    Phrase.where(user_id: self.liking_user_ids + [self.id])
  end



end
