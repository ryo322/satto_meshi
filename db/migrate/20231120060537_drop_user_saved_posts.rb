class DropUserSavedPosts < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_saved_posts
  end
end
