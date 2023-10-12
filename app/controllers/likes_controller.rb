# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :authenticate_user!

  def like
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post, like: true)

    if @like.save
      redirect_to @post, notice: 'You liked the post.'
    else
      redirect_to @post, alert: 'Unable to like the post.'
    end
  end

  def dislike
    @post = Post.find(params[:post_id])
    @dislike = current_user.likes.build(post: @post, like: false)

    if @dislike.save
      redirect_to @post, notice: 'You disliked the post.'
    else
      redirect_to @post, alert: 'Unable to dislike the post.'
    end
  end
end
