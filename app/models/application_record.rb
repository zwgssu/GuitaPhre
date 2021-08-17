class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ALLOWED_CONTENT_TYPES = %q{
    image/jpeg
    image/png
    image/gif
    image/bmp
  }

  ALLOWED_MUSIC_TYPES = %q{
    audio/mp3
    audio/wav
  }
end
