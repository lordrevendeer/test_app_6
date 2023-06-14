class AddYesno < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :ydays, :int
    add_column :habits, :ndays, :int
  end
end
