class StatsController < ActionController::Base
include Groupdate
      def new
      end

      def create
        @stat = Stat.new
      end

      def update
        if params[:x1]=='Mark Done' && !Stat.where(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).exists?
            s = Stat.new(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date)
            s.save
        elsif params[:x1]=='Unmark' && Stat.where(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).exists?
            Stat.where(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).destroy_all
        end

        respond_to do |format|
            format.js  # <-- will render `app/views/habits/update.js.erb`
        end
      end

      
end