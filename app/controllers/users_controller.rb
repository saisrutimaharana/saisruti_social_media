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
        if current_user.follow(@user)
          flash[:notice] = "You are now following this user."
        else
          flash[:alert] = "Unable to follow this user."
        end
        redirect_to @user
      end
    
      def unfollow
        @user = User.find(params[:id])
        if current_user.unfollow(@user)
          flash[:notice] = "You have unfollowed this user."
        else
          flash[:alert] = "Unable to unfollow this user."
        end
        redirect_to @user
      end
end
