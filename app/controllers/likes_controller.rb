class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)
    if @like.save
      redirect_to @post, notice: 'Liked!'
    else
      redirect_to @post, alert: 'Error liking the post.'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to @post, notice: 'Unliked.'
    else
      redirect_to @post, alert: 'Error unliking the post.'
    end
  end
end
