class Article < ApplicationRecord
   belongs_to :user
   validates :title, presence: TRUE, length: {minimum: 5,maximum: 50}
end