class StatsController < ActionController::Base

      def new
      end

      def create
        @stat = Stat.new
      end

      def update
        if Stat.find_by(done: params[:done], habit_id: params[:habit_id], times: params[:times]).nil?
            s = Stat.new(done: params[:done], habit_id: params[:habit_id], times: params[:times])
            s.save
        else
            Stat.where(done: params[:done], habit_id: params[:habit_id], times: params[:times]).destroy_all
        end

        respond_to do |format|
            format.js  # <-- will render `app/views/habits/update.js.erb`
        end
      end

      
end