
class CommentsController < ApplicationController
  before_action :authenticate_user! # Add this if you want to require user authentication

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render 'posts/show' # You may need to adjust this depending on your post view
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
