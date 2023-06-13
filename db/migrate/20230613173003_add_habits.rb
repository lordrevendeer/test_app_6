class AddHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :created_at, :datetime
    add_column :habits, :updated_at, :datetime
    add_column :habits, :user_id, :int
    add_column :habits, :description, :text
    add_column :habits, :days, :integer
    add_column :habits, :frequency, :string
  end
end
