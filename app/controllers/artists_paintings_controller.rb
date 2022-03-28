class ArtistsPaintingsController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    @paintings = @artist.paintings
  end

  def new
    @artist = Artist.find(params[:id])
  end

  def create
    artist = Artist.find(params[:id])
    painting = artist.paintings.create(painting_params)
    redirect_to "/artists/#{artist.id}/paintings"
  end

  def painting_params
    params.permit(:name, :year_finished, :abstract)
  end
end
