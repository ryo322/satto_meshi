class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @post.ingredients.build
    @post.instructions.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_list].split(/[、]/) #タグ設定の時に、で区切られるように設定
    @post.tag_list = tag_list
    if @post.save
      flash[:notice] = "レシピを投稿しました"
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def index
     if @tag = params[:tag]   # タグ検索用
       @post = Post.tagged_with(params[:tag])   # タグに紐付く投稿
     end
     if params[:latest]
       @posts = Post.latest
     elsif params[:order_by_favorites]
       @posts = Post.order_by_favorites
     elsif params[:rand]
       @posts = Post.order(Arel.sql('RAND()'))
     else
       @posts = Post.all
     end
    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @tags = @post.tag_counts_on(:tags)
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
   @user = current_user
   @post = Post.find(params[:id])
   @post.destroy
   flash[:notice] = "レシピを削除しました"
   redirect_to  root_path
  end

private

  def post_params
  params.require(:post).permit(
    :post_image, :name, :introduction, :tag_list,
    ingredients_attributes: [:name, :quantity, :_destroy, :id],
    instructions_attributes: [:step, :process_image, :_destroy, :id]
   )
  end
end
