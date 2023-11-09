class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @users = User.looks(params[:word])
    elsif @range == "レシピ"
      @posts = Post.looks(params[:word])
    else
      @tags = Tag.looks(params[:word])
    end
  end
end