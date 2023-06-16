# README Akshai
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: {  } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: {  } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

  <div class="form-group row">
            <%= f.label :category, class: "col-2 col-form-label text-light" %>
            <div class="col-10"> 
                <%= f.collection_select(:category_ids, Category.all, :id, :name) %>
            </div>
          </div>

          def self.mark_habit_not_done

         Stat.all.each do |stat| 
            @habit = Habit.where(id: stat.habit_id)

               @stat = Stat.new 
               @stat.done = false 
               @stat.habit_id = @habit.id 
               @stat.dates =  DateTime.now.strftime "%d/%m/%y"
               @stat.save
             
         end 

    end

    <% d = 0 %>
<% m = 0 %>
<% y = 0 %>

<% if @habit.frequency == "Daily" %>
    <% Stat.all.each do |stat| %>
      <% s=s+1 if stat.habit_id == @habit.id && stat.done == true %>
      <% t=t+1 if stat.habit_id == @habit.id  %>
    <% end %>
<% end %>

<% if @habit.frequency == "Weekly" %>
    <% counter = 0 %>
    <% Stat.all.each do |stat| %>
      <% s=s+1 if stat.habit_id == @habit.id && stat.done == true %>
      <% t=t+1 if stat.habit_id == @habit.id  %>
    <% end %>
<% end %>

<% if @habit.frequency == "Monthly" %>
    <% prev = "0" %>
    <% Stat.all.each do |stat| %>
      <% s=s+1 if ((stat.habit_id == @habit.id )&& (stat.dates.strftime("%m") != prev))%>
      <% t=t+1 if (stat.dates.strftime("%m") != prev)%>
    <% end %>
<% end %>

<div class="card-header font-italic">
                   <%= link_to gravatar_for(@habit.user), user_path(@habit.user) %>
                </div>

                                    <%= link_to x, render 'yes', class: "btn btn-primary", id: "completion" %>

<div class="dropdown-menu center" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="<% render 'yes', obj: @habit %>">Yes</a>
                    <a class="dropdown-item" href="<% render 'no', obj: @habit %>">No</a>
                </div>

                                        <a class="btn btn-secondary " href="<%= render 'yes', obj: @habit , id: "completion"%>"><%=x%></a>
<div class="row justify-content-md">
    <div class="container text-center">
      <% x = Stat.find_by(done: true, habit_id: @habit.id, dates: DateTime.now.strftime("%d/%m/%y")).nil? ? "Habit completed" : "Habit done for today" %>
      <%= link_to x, { controller: 'stats', action: 'update', remote: true, habit_id: @habit.id, done: "true", dates: DateTime.now.strftime("%d/%m/%y") }, class: "btn btn-primary", id: "completion" %>
    </div>
  </div>

  <div class="col-3 mt-4 d-flex custom-card">
      <div class="card text-center w-100">
        <div class="card-body p-2">
          <% x = Stat.find_by(done: true, habit_id: @habit.id, dates: DateTime.now.strftime("%d/%m/%y")).nil? ? "Habit completed" : "Habit done for today" %>
          <%= link_to x, { controller: 'stats', action: 'update', remote: true, habit_id: @habit.id, done: "true", dates: DateTime.now.strftime("%d/%m/%y") }, class: "btn btn-primary", id: "completion" %>
        </div>
      </div>
    </div>

module StatsHelper
    def calculate_streak_for_habit(h_id)
      #if Habit.where(id: h_id).first.frequency == "Daily"
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
      #end
      
      if Habit.where(id: h_id).first.frequency == "Weekly"
        stats = Stat.where(habit_id: h_id, done: true).order(:dates)

        streak = 0
        current_streak = 0
        prev_week_start = nil

        stats.each do |stat|
            date = stat.dates.to_date
            week_start = date.beginning_of_week

            if prev_week_start.nil? || week_start == prev_week_start
            current_streak += 1
            else
            current_streak = 1
            end

            streak = current_streak if current_streak > streak
            prev_week_start = week_start
        end

        streak
      end

      if Habit.where(id: h_id).first.frequency == "Monthly"
        stats = Stat.where(habit_id: h_id, done: true).order(:dates)

        streak = 0
        current_streak = 0
        prev_month_start = nil

        stats.each do |stat|
            date = stat.dates.to_date
            month_start = date.beginning_of_month

            if prev_month_start.nil? || month_start == prev_month_start
            current_streak += 1
            else
            current_streak = 1
            end

            streak = current_streak if current_streak > streak
            prev_month_start = month_start
        end

        streak
      end

      if Habit.where(id: h_id).first.frequency == "Yearly"
        stats = Stat.where(habit_id: h_id, done: true).order(:dates)

        streak = 0
        current_streak = 0
        prev_year_start = nil

        stats.each do |stat|
            date = stat.dates.to_date
            year_start = date.beginning_of_year

            if prev_year_start.nil? || year_start == prev_year_start
            current_streak += 1
            else
            current_streak = 1
            end

            streak = current_streak if current_streak > streak
            prev_year_start = year_start
        end

        streak
      end

    end

    def calculate_current_streak_for_habit(h_id)
        if Habit.where(id: h_id).first.frequency == "Daily"
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
        
            current_streak
          end
          
          if Habit.where(id: h_id).first.frequency == "Weekly"
            stats = Stat.where(habit_id: h_id, done: true).order(:dates)
    
            streak = 0
            current_streak = 0
            prev_week_start = nil
    
            stats.each do |stat|
                date = stat.dates.to_date
                week_start = date.beginning_of_week
    
                if prev_week_start.nil? || week_start == prev_week_start
                current_streak += 1
                else
                current_streak = 1
                end
    
                streak = current_streak if current_streak > streak
                prev_week_start = week_start
            end
    
            current_streak
          end
    
          if Habit.where(id: h_id).first.frequency == "Monthly"
            stats = Stat.where(habit_id: h_id, done: true).order(:dates)
    
            streak = 0
            current_streak = 0
            prev_month_start = nil
    
            stats.each do |stat|
                date = stat.dates.to_date
                month_start = date.beginning_of_month
    
                if prev_month_start.nil? || month_start == prev_month_start
                current_streak += 1
                else
                current_streak = 1
                end
    
                streak = current_streak if current_streak > streak
                prev_month_start = month_start
            end
    
            current_streak
          end
    
          if Habit.where(id: h_id).first.frequency == "Yearly"
            stats = Stat.where(habit_id: h_id, done: true).order(:dates)
    
            current_streak = 0
            prev_year_start = nil
    
            stats.each do |stat|
                date = stat.dates.to_date
                year_start = date.beginning_of_year
    
                if prev_year_start.nil? || year_start == prev_year_start
                current_streak += 1
                else
                current_streak = 1
                end
    
                streak = current_streak if current_streak > streak
                prev_year_start = year_start
            end
    
            current_streak
          end
      end
 end    