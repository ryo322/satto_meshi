class Post < ApplicationRecord
  
  belongs_to :user
  has_one_attached :post_image
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_users, through: :user_saved_posts, source: :user
  has_many :user_saved_posts, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, :how_to_makes, allow_destroy: true
  
  #いいねが多い順に並び替え
  scope :order_by_favorites, -> { order(favorites_count: :desc) }
  #新着順に並び替え
  scope :latest, -> {order(created_at: :desc)}

  validates :name, presence: true
  validates :introduction, presence: true

  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #いいね
 def favorited_by?(user)
    user && favorites.exists?(user_id: user.id)
 end
  
  #いいね数の計算
  def update_favorites_count
    update(favorites_count: favorites.count)
  end
  
  #投稿レシピ検索
  def self.looks(word)
    @post = Post.where("name LIKE ?", "%#{word}%")
  end
end
