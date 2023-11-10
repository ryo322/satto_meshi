class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :post, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_saved_posts, dependent: :destroy
  has_many :saved_posts, through: :user_saved_posts, source: :post
  
  #ゲスト情報
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end 
 
  #ユーザー検索
  def self.looks(word)
    @user = User.where("name LIKE ?", "%#{word}%")
  end
  
  #いいねした投稿の取得
  def favorited_posts
    Post.joins(:favorites).where(favorites: { user_id: self.id })
  end

end
