class Habit < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :title, presence: TRUE, length: {minimum: 5,maximum: 50}
    validates :description, presence: TRUE, length: {minimum: 20,maximum: 500}
    validates :days, numericality: { only_integer: true, greater_than: 0 }
 end