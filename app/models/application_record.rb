class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #アップロード可能な拡張子をまとめる
  ALLOWED_CONTENT_TYPES = %q{
    image/jpeg
    image/png
    image/gif
    image/bmp
  }

  ALLOWED_MUSIC_TYPES = %q{
    audio/mpeg
    audio/x-wav
    audio/flac
    audio/ogg
    audio/vnd.wave
  }
end
