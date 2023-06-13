class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :yesname
    remove_column :articles, :noname
    remove_column :articles, :category_id
  end
end
