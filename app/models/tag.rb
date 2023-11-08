class Tag < ApplicationRecord
  
  #タグ検索
  def self.looks(word)
    @tag = Tag.where("name LIKE ?", "%#{word}%")
  end
end
