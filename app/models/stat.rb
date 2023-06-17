class Stat < ApplicationRecord
    validates_uniqueness_of :times, :scope => [:habit_id,:done]   

    def self.mark_habit_not_done_daily

        Habit.where(frequency: "Daily").each do |habit| 
            count2 = 0
            d = 1.day.ago.strftime "%d/%m/%y"
            Stat.where(habit_id: habit.id).each do |stat|
                if stat.dates.strftime "%d/%m/%y" == d
                    count2 = 1
                end    
            end  
            
            if count2 == 0
                @stat = Stat.new 
                @stat.done = false 
                @stat.habit_id = habit.id 
                @stat.dates =  1.day.ago.strftime "%d/%m/%y"
                @stat.save
            end    
        end 

    end

    def self.mark_habit_not_done_weekly
        Habit.where(frequency: "Weekly").each do |habit|
          count2 = 0
          week_start = 1.week.ago.beginning_of_week
          week_end = 1.week.ago.end_of_week
      
          Stat.where(habit_id: habit.id).each do |stat|
            if stat.dates.between?(week_start, week_end)
              count2 = 1
            end
          end
      
          if count2 == 0
            stat = Stat.new
            stat.done = false
            stat.habit_id = habit.id
            stat.dates = week_end
            stat.save
          end
        end
    end

   def self.mark_habit_not_done_monthly

        Habit.where(frequency: "Monthly").each do |habit| 
                count = 0
                m = 1.month.ago.strftime "%m/%y"
                Stat.where(habit_id: habit.id).each do |stat|
                    if stat.dates.strftime "%m/%y" == m
                        count = 1
                    end    
                end  
                
                if count == 0
                    @stat = Stat.new 
                    @stat.done = false 
                    @stat.habit_id = habit.id 
                    @stat.dates =  1.month.ago.strftime "%d/%m/%y"
                    @stat.save
                end    
        end 

    end

   def self.mark_habit_not_done_yearly

        Habit.where(frequency: "Yearly").each do |habit| 
                count1 = 0
                y = 1.year.ago.strftime "%y"
                Stat.where(habit_id: habit.id).each do |stat|
                    if stat.dates.strftime "%y" == y
                        count1 = 1
                    end    
                end  
                
                if count1 == 0
                    @stat = Stat.new 
                    @stat.done = false 
                    @stat.habit_id = habit.id 
                    @stat.dates =  1.year.ago.strftime "%d/%m/%y"
                    @stat.save
                end    
        end 

    end

end  