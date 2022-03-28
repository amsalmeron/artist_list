class ArtistsController < ApplicationController
  def index
    @artists = Artist.sort_alphabetically
  end

  def show
    @artist = Artist.find(params[:id])
    @painting_count = Artist.find(params[:id]).paintings.count
  end

  def new

  end

  def create
    artist = Artist.create(artist_params)
    redirect_to "/artists"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

  private

    def artist_params
      params.permit(:name, :birth_year, :living)
    end

end
