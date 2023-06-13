class CreateStat < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :habit_id 
      t.date :dates
    end
  end
end
