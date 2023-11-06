class RemoveTagIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :tag_id
  end
end
