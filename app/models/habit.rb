class Habit < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :title, presence: TRUE, length: {minimum: 3,maximum: 50}
    validates :description, presence: TRUE, length: {minimum: 3,maximum: 500}
    validates :days, numericality: { only_integer: true, greater_than: 0 }
    validates_uniqueness_of :frequency, :scope => [:title, :description, :days], :message => ",description,days,title combination must be unique"
 end