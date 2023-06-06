class Article < ApplicationRecord
   validates :title, presence: TRUE, length: {minimum: 5,maximum: 50}
end