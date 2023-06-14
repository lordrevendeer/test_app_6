class AddDoneStats < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :done, :boolean, default: false
  end
end
