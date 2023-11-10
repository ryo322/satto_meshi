class Public::SavedPostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.saved_posts << @post
    redirect_to post_path(@post), notice: '投稿を保存しました'
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.saved_posts.delete(@post)
    redirect_to user_path(current_user), notice: '保存から削除しました'
  end
end
