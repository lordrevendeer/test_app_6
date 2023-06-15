class Category < ApplicationRecord
  has_many :habits, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end    