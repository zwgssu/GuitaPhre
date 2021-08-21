class FavoritePhrase < ApplicationRecord
  belongs_to :user
  belongs_to :phrase
end
