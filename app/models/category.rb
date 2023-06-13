class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  has_many :habit_categories
  has_many :habits, through: :habit_categories
end    