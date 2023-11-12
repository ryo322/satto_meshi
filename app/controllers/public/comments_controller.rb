class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      flash[:alert] = "コメントの保存に失敗しました。"
      redirect_to post_path(post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
