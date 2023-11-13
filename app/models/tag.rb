class Tag < ApplicationRecord
  
  has_and_belongs_to_many :posts
  
  #タグ検索
  def self.looks(word)
    where("name LIKE ?", "%#{word}%")
  end
end
