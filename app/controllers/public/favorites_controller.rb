class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.likes(post)
    redirect_to post_path(post), notice: 'いいねしました。'
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlikes(post)
    redirect_to post_path(post), notice: 'いいねを取り消しました。'
  end
end
