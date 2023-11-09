class Post < ApplicationRecord
  
  belongs_to :user
  has_one_attached :post_image
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  #いいねが多い順に並び替え
  scope :order_by_favorites, -> { order(favorites_count: :desc) }
  #新着順に並び替え
  scope :latest, -> {order(created_at: :desc)}

  validates :name, presence: true
  validates :introduction, presence: true
  validates :material, presence: true

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
