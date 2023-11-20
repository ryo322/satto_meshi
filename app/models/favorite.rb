class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  validates :user_id, uniqueness: {scope: :post_id}
  
  after_create :update_post_favorites_count
  after_destroy :update_post_favorites_count
  
private


  def update_post_favorites_count
    post.update_favorites_count
  end
end
