class HabitsController < ApplicationController

    before_action :set_habit, only:[:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:show, :edit, :update, :destroy]
    def show
    end

    def index
        @habits = Habit.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
        @habit = Habit.where(user_id: current_user.id)
    end    

    def new
        @habit = Habit.new 
    end
    
    def create
        @habit = Habit.new(habit_params)
        @habit.user = current_user
        @habit.ydays = 0
        @habit.ndays = 0
        if @habit.save
          flash[:notice] = "Habit displayed successfully"  
          redirect_to @habit
        else
            render 'new'
        end    
    end   
    
    def edit

    end
    
    def update

        if @habit.update(habit_params)
            flash[:notice] = "Habit updated successfully"
            redirect_to @habit
        else
            render 'edit'
        end        
    end   
    
    def destroy

        @habit.destroy
        redirect_to habits_path
    end    

private
   def set_habit
    @habit = Habit.find_by(id: params[:id])
    unless @habit
      # Handle the case when the Habit record doesn't exist
      # For example, you can redirect to an error page or show a flash message
      redirect_to root_path, alert: "Habit not found."
    end
  end  
   
   def habit_params
     params.require(:habit).permit(:title, :description, :days,  :frequency, :category_id)
   end 

   def require_same_user
    if current_user != @habit.user 
      flash[:alert] = "You can only edit or delete your own habit"
      redirect_to habits_path      
    end
   end 
    
end        