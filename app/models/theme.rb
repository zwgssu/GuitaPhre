class Theme < ApplicationRecord
  belongs_to :user

  has_one_attached :music_file
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :overview, presence: true, length: { maximum: 500 }
  validate :music_file_presence
  validates :music_file, blob: { content_type: ['audio/mpeg', 'audio/x-wav', 'audio/flac', 'audio/ogg', "audio/wav"] }
  with_options length: { maximum: 30 } do
    validates :tag_1
    validates :tag_2
    validates :tag_3
  end
  
  def music_file_presence
    if music_file.attached?
    else
      errors.add(:music_file, 'ファイルを添付してください')
    end
  end
end