class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @post.recipe_ingredients.build
    @post.how_to_makes.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "レシピを投稿しました"
      redirect_to posts_path
    else
      render "new"
    end
  end

  def index
    if params[:latest]
      @posts = Post.latest
    elsif params[:order_by_favorites]
       @posts = Post.order_by_favorites
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:notice] = "レシピを更新しました"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   flash[:notice] = "レシピを削除しました"
   redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:post_image, :name, :introduction, :tag_id,
    recipe_ingredients_attributes:[:ing_name, :quantity, :_destroy, :id,], 
    how_to_makes_attributes:[:explanation, :process_image, :order_no, :_destroy, :id,])
  end
end
