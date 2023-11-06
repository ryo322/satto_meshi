class Public::HomesController < ApplicationController
  def top
    @posts = Post.order('id DESC')
  end
end
