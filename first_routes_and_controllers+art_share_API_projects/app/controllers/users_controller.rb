class UsersController < ApplicationController
    
    def index
        if params[:username]
            @users = User.find_by(username: params[:username])
        else
            @users = User.all
        end
        
        render json: @users
    end

    def create
        @user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def show
        @user = User.find(params[:id])
        @user_with_likes = {user: @user, liked_comments: @user.liked_comments, liked_artworks: @user.liked_artworks}
        
        render json: @user_with_likes
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            redirect_to show_user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])

        @user.destroy
        redirect_to users_url
    end

    def favorited_artworks
        @favorited_artworks = User.find(params[:id]).favorited_artworks
        @favorited_shared_artworks = User.find(params[:id]).favorited_shared_artworks

        @all_favorted_artworks = {favorited_artworks: @favorited_artworks, favorited_shared_artworks: @favorited_shared_artworks}

        render json: @all_favorted_artworks
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end