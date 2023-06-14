class Stat < ApplicationRecord
    validates_uniqueness_of :dates, :scope => [:habit_id,:done]   
    
    def self.mark_habit_not_done

         Stat.all.each do |stat| 
            @habit = Habit.where(id: stat.habit_id)

               @stat = Stat.new 
               @stat.done = false 
               @stat.habit_id = @habit.id 
               @stat.dates =  DateTime.now.strftime "%d/%m/%y"
               @stat.save
             
         end 

    end

end  