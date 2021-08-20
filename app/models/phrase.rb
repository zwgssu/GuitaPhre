class Phrase < ApplicationRecord
  belongs_to :user
  
  has_one_attached :music_file
  attribute :new_music_file

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :guitar, length: { maximum: 300 }
  validates :user_only, inclusion: { in: [true, false]}
  with_options length: { maximum: 30 } do
    validates :tag_1
    validates :tag_2
    validates :tag_3
  end
  validate if: :new_music_file do
    if new_music_file.respond_to?(:content_type)
      unless new_music_file.content_type.in?(ALLOWED_MUSIC_TYPES)
        errors.add(:new_music_file, :invalid_music_type)
      end
    else
      errors.add(:new_music_file, :invalid)
    end
  end

  before_save do
    if new_music_file
      self.music_file = new_music_file
    end
  end
end
