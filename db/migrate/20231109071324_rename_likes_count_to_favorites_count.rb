class RenameLikesCountToFavoritesCount < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :likes_count, :favorites_count
  end
end
