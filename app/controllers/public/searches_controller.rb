class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]

    case @range
    when "ユーザー"
      @results = User.looks(@word)
      @results = @results.page(params[:page]).per(10)
    when "レシピ"
      @results = Post.looks(@word)
      @results = @results.page(params[:page]).per(10)
    when "タグ"
      @results = Post.tagged_with(@word)
      @results = @results.page(params[:page]).per(10)
    end
  end
end
