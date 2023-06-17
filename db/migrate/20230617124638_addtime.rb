class Addtime < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :times, :datetime
  end
end
