class StatsController < ActionController::Base

      def new
      end

      def create
        @stat = Stat.new
      end

      def update
        if Stat.find_by(done: params[:done], habit_id: params[:habit_id], dates: params[:dates]).nil?
            s = Stat.new(done: params[:done], habit_id: params[:habit_id], dates: params[:dates])
            s.save
        else
            Stat.where(done: params[:done], habit_id: params[:habit_id], dates: params[:dates]).destroy_all
        end

        respond_to do |format|
            format.js  # <-- will render `app/views/habits/update.js.erb`
        end
      end

      def calculate_streak(habit_id)
        streak = 0
        current_streak = 0
        previous_date = nil

        Stat.where(habit_id: habit_id).order(:dates).each do |record|
            if record.done && (previous_date.nil? || record.dates == previous_date + 1.day)
            current_streak += 1
            else
            streak = [streak, current_streak].max
            current_streak = 0
            end

            previous_date = record.dates
        end

        [streak, current_streak].max
      end
end