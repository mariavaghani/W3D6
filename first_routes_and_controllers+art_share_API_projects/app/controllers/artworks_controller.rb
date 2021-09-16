class ArtworksController < ApplicationController

    def index
        @user_artworks = User.find(params[:user_id]).artworks
        @user_shared_artworks = User.find(params[:user_id]).shared_artworks
        @artworks_to_show = {created_artworks: @user_artworks, shared_artworks: @user_shared_artworks}
        render json: @artworks_to_show
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
            # redirect_to action: 'show' id: @artwork.id
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])

        @artwork.destroy
        redirect_to artworks_url
    end

    # def like
    #     render json: params
        
    # end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end