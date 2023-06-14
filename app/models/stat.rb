class Stat < ApplicationRecord
    validates_uniqueness_of :dates, :scope => [:habit_id]       
end  