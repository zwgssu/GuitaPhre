class Phrase < ApplicationRecord
  belongs_to :user
  has_many :favorite_phrases, dependent: :destroy
  has_many :likers, through: :favorite_phrases, source: :user
  has_many :comments, dependent: :destroy
  has_many :commented_by, through: :comments, source: :user
  
  has_one_attached :music_file

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :guitar, length: { maximum: 500 }
  validates :user_only, inclusion: { in: [true, false]}
  validate :music_file_presence, on: :create
  with_options length: { maximum: 30 } do
    validates :tag_1
    validates :tag_2
    validates :tag_3
  end

  
  def music_file_presence
    if music_file.attached?
      unless music_file.content_type.in?(ALLOWED_MUSIC_TYPES)
        errors.add(:music_file, :invalid_music_type)
      end
    else
      errors.add(:music_file, 'を添付してください')
    end
  end
end