class Habit < ApplicationRecord
    belongs_to :user
    has_many :habit_categories
    has_many :categories, through: :habit_categories
    validates :title, presence: TRUE, length: {minimum: 5,maximum: 50}
 end