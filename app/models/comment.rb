class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :phrase
  
  validates :content, presence: true
end
