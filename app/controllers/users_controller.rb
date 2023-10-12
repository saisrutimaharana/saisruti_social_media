class UsersController < ApplicationController
    # def index
    #     @user = current_user # Or retrieve the user you want to display posts for
    #     @posts = @user.posts # Assuming you want to display posts for this user
    # end

    def new
        @user = User.new
    end

    def like(post)
        post_interaction.create(post: post, reaction: 'like')
    end
    def user_params
        params.require(:user).permit(:username, :email, :password, :phone, :country, :date_of_birth, :gender)
    end

    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to root_path, notice: 'Registration was successful.'
        else
          render :new
        end
    end
    
    def follow
        @user = User.find(params[:id])
        @current_user.followees << @user
        redirect_to user_path(@user)
    end
    
    def unfollow
        @user = User.find(params[:id])
        @current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_to user_path(@user)
    end
end