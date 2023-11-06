class Post < ApplicationRecord
  
  belongs_to :user
  has_one_attached :post_image

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

end
