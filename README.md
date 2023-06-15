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
