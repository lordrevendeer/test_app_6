class AddFrequencyToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :frequency, :string
  end
end
