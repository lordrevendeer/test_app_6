class StatsController < ActionController::Base
include Groupdate
      def new
      end

      def create
        @stat = Stat.new
      end

      def update
        if params[:x1]=='Mark Done'
          if !Stat.where(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).exists?
            s = Stat.new(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date)
            s.save
            respond_to do |format|
              format.js do
                render "stats/update.js.erb"
              end
            end
          else
            flash[:notice] = "Already Marked Done" 
            respond_to do |format|
              format.js do
                render "stats/reload.js.erb"
              end
            end
          end
        elsif params[:x1]=='Unmark'
          if Stat.where(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).exists?
            Stat.where(done: params[:done], habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).destroy_all
            respond_to do |format|
              format.js do
                render "stats/update.js.erb"
              end
            end
          else 
            flash[:notice] = "Already Unmarked" 
            respond_to do |format|
              format.js do
                render "stats/reload.js.erb"
              end
            end 
          end  
        end
      end

      
end