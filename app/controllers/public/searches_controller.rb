class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]

    case @range
    when "ユーザー"
      @results = User.looks(@word)
    when "レシピ"
      @results = Post.looks(@word)
    when "タグ"
      @results = Post.tagged_with(@word)
    end
  end
end
