class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to @user, notice: 'You are now following this user.'
  end

  def destroy
    @user = Friendship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user, notice: 'You have unfollowed this user.'
  end
end
