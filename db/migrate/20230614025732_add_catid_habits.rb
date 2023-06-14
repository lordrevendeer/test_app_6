class AddCatidHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :category_id, :int
  end
end
