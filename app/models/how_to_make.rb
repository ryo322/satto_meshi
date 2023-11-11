class HowToMake < ApplicationRecord
  belongs_to :post
  has_one_attached :process_image 
  
  validates :explanation, presence: true
  
 def get_process_image(width, height)
    if process_image.present? && process_image.attached?
      process_image.variant(resize_to_limit: [width, height]).processed
    end
  end
end
