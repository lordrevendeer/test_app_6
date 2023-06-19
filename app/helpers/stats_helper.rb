
module StatsHelper
    def count_yes(h_id)
            if(Habit.where(id: h_id).first.frequency == "Dailly")
                      
              yes = Stat.where(habit_id: h_id, done: true).count

              yes
            elsif(Habit.where(id: h_id).first.frequency == "Weekly")
                
                stats = Stat.where(habit_id: h_id, done: true).order(:times)

                weeks_with_true = 0
                prev_time = nil

                stats.each do |stat|
                  time = stat.times.to_date

                  if prev_time.nil? || time.year != prev_time.year || time.cweek != prev_time.cweek
                    weeks_with_true += 1
                  end

                  prev_time = time
                end

                weeks_with_true

          elsif(Habit.where(id: h_id).first.frequency == "Monthly")
                  stats = Stat.where(habit_id: h_id, done: true).order(:times)

                  months_with_true = 0
                  prev_month = nil
                  
                  stats.each do |stat|
                    month = stat.times.strftime('%Y-%m')
                  
                    if prev_month.nil? || month > prev_month
                      months_with_true += 1
                      prev_month = month
                    end
                  end
                  
                  months_with_true
            
            
          else
                stats = Stat.where(habit_id: h_id, done: true).order(:times)

                years_with_true = 0
                prev_year = nil
                
                stats.each do |stat|
                  year = stat.times.year
                
                  if prev_year.nil? || year > prev_year
                    years_with_true += 1
                    prev_year = year
                  end
                end
                
                years_with_true
            
          end  

    end
    def calculate_streak_for_habit(h_id)
      if(Habit.where(id: h_id).first.frequency == "Daily") 
          stats = Stat.where(habit_id: h_id, done: true).order(:times)
      
          streak = 0
          current_streak = 0
          prev_date = nil
      
          stats.each do |stat|
            date = stat.times.to_date


            if prev_date.nil? || date == prev_date + 1.day
              current_streak += 1
            else
              current_streak = 1
            end
      
            streak = current_streak if current_streak > streak
            prev_date = date
          end
      
          streak
      elsif(Habit.where(id: h_id).first.frequency == "Weekly")
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        streak = 0
        current_streak = 0
        prev_time = nil

        stats.each do |stat|
          time = stat.times.to_date

          if prev_time.nil? || (time.year == prev_time.year && time.cweek == prev_time.cweek + 1) || (time.year == prev_time.year + 1 && time.cweek == 1 && prev_time.cweek == 52)
            current_streak += 1
          elsif time.year != prev_time.year || time.cweek != prev_time.cweek
            streak = [streak, current_streak].max
            current_streak = 1
          end

          prev_time = time
        end

        streak = [streak, current_streak].max
        streak
      elsif(Habit.where(id: h_id).first.frequency == "Monthly")
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        streak = 0
        current_streak = 0
        prev_time = nil

        stats.each do |stat|
          time = stat.times

          if prev_time.nil? || (time.year == prev_time.year && time.month == prev_time.month + 1) || (time.year == prev_time.year + 1 && time.month == 1 && prev_time.month == 12)
            current_streak += 1
          elsif time.year != prev_time.year || time.month != prev_time.month
            streak = [streak, current_streak].max
            current_streak = 1
          end

          prev_time = time
        end

        streak = [streak, current_streak].max
        streak
  
      else
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        streak = 0
        current_streak = 0
        prev_year = nil
        
        stats.each do |stat|
          year = stat.times.year
        
          if prev_year.nil? || year == prev_year + 1
            current_streak += 1
          elsif year != prev_year
            streak = [streak, current_streak].max
            current_streak = 1
          end
        
          prev_year = year
        end
        
        streak = [streak, current_streak].max
        streak
        
        end      
    end

    def calculate_current_streak_for_habit(h_id)
      if(Habit.where(id: h_id).first.frequency == "Daily") 
        stats = Stat.where(habit_id: h_id, done: true).order(:times)
      
        current_streak = 0
        prev_date = nil
      
        stats.each do |stat|
          date = stat.times.to_date
      
          if prev_date.nil? || date == prev_date + 1.day
            current_streak += 1
          else
            current_streak = 1
            break
          end
      
          prev_date = date
        end
      
        current_streak
      elsif(Habit.where(id: h_id).first.frequency == "Weekly")
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        streak = 0
        current_streak = 0
        prev_time = nil

        stats.each do |stat|
          time = stat.times.to_date

          if prev_time.nil? || (time.year == prev_time.year && time.cweek == prev_time.cweek + 1) || (time.year == prev_time.year + 1 && time.cweek == 1 && prev_time.cweek == 52)
            current_streak += 1
          elsif time.year != prev_time.year || time.cweek != prev_time.cweek
            streak = [streak, current_streak].max
            current_streak = 1
          end

          prev_time = time
        end

        current_streak

      elsif(Habit.where(id: h_id).first.frequency == "Monthly")
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        streak = 0
        current_streak = 0
        prev_time = nil

        stats.each do |stat|
          time = stat.times

          if prev_time.nil? || (time.year == prev_time.year && time.month == prev_time.month + 1) || (time.year == prev_time.year + 1 && time.month == 1 && prev_time.month == 12)
            current_streak += 1
          elsif time.year != prev_time.year || time.month != prev_time.month
            streak = [streak, current_streak].max
            current_streak = 1
          end

          prev_time = time
        end

        current_streak  
      else
        stats = Stat.where(habit_id: h_id, done: true).order(:times)

        streak = 0
        current_streak = 0
        prev_year = nil

        stats.each do |stat|
          year = stat.times.year

          if prev_year.nil? || year == prev_year + 1
            current_streak += 1
          elsif year != prev_year
            streak = [streak, current_streak].max
            current_streak = 1
          end

          prev_year = year
        end

        current_streak

      end  
    end

    def calculate_missed(h_id)
      
        if(Habit.where(id: h_id).first.frequency == "Daily")
            stats = Stat.where(habit_id: h_id, done: true).order(:times)

            current_streak = 0
            days_missed = 0
            prev_time = Habit.where(id: h_id).first.created_at - 1.day

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
          
        elsif(Habit.where(id: h_id).first.frequency == "Weekly")
              stats = Stat.where(habit_id: h_id, done: true).order(:times)

              current_streak = 0
              weeks_missed = 0
              prev_time = Habit.where(id: h_id).first.created_at - 1.week
              
              stats.each do |stat|
                time = stat.times
              
                if prev_time.nil? || (time.to_date - prev_time.to_date).to_i <= 7
                  current_streak += 1
                elsif (time.to_date - prev_time.to_date).to_i > 7
                  weeks_missed += ((time.to_date - prev_time.to_date).to_i / 7).to_i
                  current_streak = 1
                end
              
                prev_time = time
              end
              
              weeks_missed

        elsif(Habit.where(id: h_id).first.frequency == "Monthly")
              stats = Stat.where(habit_id: h_id, done: true).order(:times)
              if stats.count == 0 
              t = Habit.where(id: h_id).first.created_at - 1.month
              y2 = DateTime.now.year
              m2 = DateTime.now.month
              else
              t = stats.first.times - 1.month
              y2 = stats.last.times.year
              m2 = stats.last.times.month
              end
              y1 = t.year
              
              m1 = t.month
              
              months_missed = ((y2 - y1) * 12 + m2 - m1 - 2) - count_yes(h_id)
              months_missed
          
        else
              stats = Stat.where(habit_id: h_id, done: true).order(:times)

              current_streak = 0
              years_missed = 0
              prev_time = Habit.where(id: h_id).first.created_at - 1.year
              
              stats.each do |stat|
                time = stat.times
              
                if prev_time.nil? || (time.year - prev_time.year) == 1
                  current_streak += 1
                elsif (time.year - prev_time.year) > 1
                  years_missed += time.year - prev_time.year - 1
                  current_streak = 1
                end
              
                prev_time = time
              end
              
              years_missed
        end  

    end  
 end
  