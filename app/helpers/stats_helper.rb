
module StatsHelper
    def calculate_streak_for_habit(h_id)
      stats = Stat.where(habit_id: h_id, done: true).order(:dates)
  
      streak = 0
      current_streak = 0
      prev_date = nil
  
      stats.each do |stat|
        date = stat.dates.to_date
  
        if prev_date.nil? || date == prev_date + 1.day
          current_streak += 1
        else
          current_streak = 1
        end
  
        streak = current_streak if current_streak > streak
        prev_date = date
      end
  
      streak
    end

    def calculate_current_streak_for_habit(h_id)
        stats = Stat.where(habit_id: h_id, done: true).order(:dates)
      
        current_streak = 0
        prev_date = nil
      
        stats.each do |stat|
          date = stat.dates.to_date
      
          if prev_date.nil? || date == prev_date + 1.day
            current_streak += 1
          else
            break
          end
      
          prev_date = date
        end
      
        current_streak
      end
 end
  