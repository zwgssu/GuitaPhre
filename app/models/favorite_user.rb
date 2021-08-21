class FavoriteUser < ApplicationRecord
  belongs_to :user
  belongs_to :fav_user, class_name: "User"
end
