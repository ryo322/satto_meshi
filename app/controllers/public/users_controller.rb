class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def favorited_posts
    @user = current_user
    @favorited_posts = @user.favorited_posts
    render 'favorite'
  end
  
  def save_post
    @post = Post.find(params[:post_id])
    current_user.saved_posts << @post unless current_user.saved_posts.include?(@post)
    redirect_to @post, notice: '投稿を保存しました。'
  end

  def edit
    @user = current_user
    is_matching_login_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def confirm
    is_matching_login_user
  end

  def withdraw
    @user = current_user
    is_matching_login_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
private
  
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
end
