class Theme < ApplicationRecord
  belongs_to :user
  has_many :theme_comments, dependent: :destroy
  has_many :theme_commented_by, through: :theme_comments, source: :user

  has_one_attached :music_file
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :overview, presence: true, length: { maximum: 1000 }
  validate :music_file_presence, on: :create
  with_options length: { maximum: 30 } do
    validates :tag_1
    validates :tag_2
    validates :tag_3
  end
  
  #音声ファイルが空じゃないかと、ファイルの拡張子をチェックする
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