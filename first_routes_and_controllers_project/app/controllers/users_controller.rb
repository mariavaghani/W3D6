class UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.error.full_messages, status: 422
        end
    end

    def show
        render json: params
    end

    private

    def user_params
        params.require(:user).permit(:email, :name)
    end

end