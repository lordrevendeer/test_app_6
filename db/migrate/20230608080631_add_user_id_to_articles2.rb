class AddUserIdToArticles2 < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :int
  end
end
