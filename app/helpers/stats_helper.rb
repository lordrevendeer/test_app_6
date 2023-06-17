
module StatsHelper
    def calculate_streak_for_habit(h_id)
      stats = Stat.where(habit_id: h_id, done: true).order(:times)
  
      streak = 0
      current_streak = 0
      prev_date = nil
  
      stats.each do |stat|
        date = stat.times


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
        stats = Stat.where(habit_id: h_id, done: true).order(:times)
      
        current_streak = 0
        prev_date = nil
      
        stats.each do |stat|
          date = stat.times
      
          if prev_date.nil? || date == prev_date + 1.day
            current_streak += 1
          else
            break
          end
      
          prev_date = date
        end
      
        current_streak
    end

    def calculate_missed(h_id)
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        current_streak = 0
        days_missed = 0
        prev_time = nil

        stats.each do |stat|
          time = stat.times

          if prev_time.nil? || time.to_date == prev_time.to_date + 1
            current_streak += 1
          elsif time.to_date > prev_time.to_date + 1
            days_missed += (time.to_date - prev_time.to_date - 1).to_i
          end

          prev_time = time
        end

        days_missed

    end  
 end
  