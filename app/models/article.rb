class Article < ApplicationRecord
   belongs_to :user
   has_many :article_categories
   has_many :categories, through: :article_categories
   validates :title, presence: TRUE, length: {minimum: 5,maximum: 50}
end