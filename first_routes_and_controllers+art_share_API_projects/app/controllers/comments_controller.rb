class CommentsController < ApplicationController

    def index
        if params[:user_id]
            @comment = User.find(params[:user_id]).comments
        elsif params[:artwork_id]
            @comment = Artwork.find(params[:artwork_id]).comments
        end

        render json: @comment
    end

    def create
        @comment = Comment.new(comment_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if @comment.save
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        
        render json: @comment
        @comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end