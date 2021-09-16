class CommentsController < ApplicationController

    def index
        @user_artworks = User.find(params[:user_id]).artworks
        @user_shared_artworks = User.find(params[:user_id]).shared_artworks
        @artworks_to_show = {created_artworks: @user_artworks, shared_artworks: @user_shared_artworks}
        render json: @artworks_to_show
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

    def destroy
        @user = User.find(params[:id])

        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end