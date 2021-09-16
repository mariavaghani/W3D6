class ArtworksController < ApplicationController

    def index
        @artworks = Artwork.all
        render json: @artworks
    end

    def create
        @artwork = Artwork.new(artwork_params)
        # replace the `user_attributes_here` with the actual attribute keys
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

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end