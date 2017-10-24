class ArtworksController < ApplicationController
  def index

    if params[:user_id]
      user = User.find(params[:user_id])
      @artworks = user.artworks + user.shared_artworks
      render json: @artworks
    else
      @artworks = Artwork.all
      render json: @artworks
    end
  end

  def create
    # render json: user_params
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if Artwork.delete(params[:id])
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
