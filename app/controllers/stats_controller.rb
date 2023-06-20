class StatsController < ActionController::Base
include Groupdate
      def new
      end

      def create
        @stat = Stat.new
      end

      def update
        if params[:x1]=='Mark Done'

            if !Stat.where(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Daily"
              s = Stat.new(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date)
              s.save
              respond_to do |format|
                format.js do
                  render "stats/update.js.erb"
                end
              end
            elsif !Stat.where(done: true, habit_id: params[:habit_id]).where(times: DateTime.now.beginning_of_month..DateTime.now.end_of_month).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Monthly"
              s = Stat.new(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date)
              s.save
              respond_to do |format|
                format.js do
                  render "stats/update.js.erb"
                end
              end
            elsif !Stat.where(done: true, habit_id: params[:habit_id]).where(times: DateTime.now.beginning_of_week..DateTime.now.end_of_week).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Weekly"
              s = Stat.new(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date)
              s.save
              respond_to do |format|
                format.js do
                  render "stats/update.js.erb"
                end
              end
              
            elsif !Stat.where(done: true, habit_id: params[:habit_id]).where(times: DateTime.now.beginning_of_year..DateTime.now.end_of_year).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Yearly"
              s = Stat.new(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date)
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
          if Stat.where(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Daily"
            Stat.where(done: true, habit_id: params[:habit_id], times: DateTime.now.to_date ..DateTime.now.to_date + 1.day).destroy_all
            respond_to do |format|
              format.js do
                render "stats/update.js.erb"
              end
            end
          elsif Stat.where(done: true, habit_id: params[:habit_id]).where(times: DateTime.now.beginning_of_month..DateTime.now.end_of_month).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Monthly"
            Stat.where(done: true, habit_id: params[:habit_id], times: DateTime.now.beginning_of_month..DateTime.now.end_of_month).destroy_all
            respond_to do |format|
              format.js do
                render "stats/update.js.erb"
              end
            end  
          elsif Stat.where(done: true, habit_id: params[:habit_id]).where(times: DateTime.now.beginning_of_year..DateTime.now.end_of_year).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Yearly"
            Stat.where(done: true, habit_id: params[:habit_id], times: DateTime.now.beginning_of_year..DateTime.now.end_of_year).destroy_all
            respond_to do |format|
              format.js do
                render "stats/update.js.erb"
              end
            end
          elsif Stat.where(done: true, habit_id: params[:habit_id]).where(times: DateTime.now.beginning_of_week..DateTime.now.end_of_week).exists? && Habit.find_by(id: params[:habit_id]).frequency == "Weekly"
              Stat.where(done: true, habit_id: params[:habit_id], times: DateTime.now.beginning_of_week..DateTime.now.end_of_week).destroy_all
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