class ArtistsPaintingsController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    if params[:sort] == 'asc'
      @paintings = @artist.sort_alpha
    elsif params[:threshold] != nil
      @paintings = @artist.year_limit(params[:threshold])
    else
      @paintings = @artist.paintings
    end
  end

  def new
    @artist = Artist.find(params[:id])
  end

  def create
    artist = Artist.find(params[:id])
    painting = artist.paintings.create(painting_params)
    redirect_to "/artists/#{artist.id}/paintings"
  end

  def update
    @artist = Artist.find(params[:id])
    redirect_to "/artists/#{@artist.id}/paintings"
  end

  private

    def painting_params
      params.permit(:name, :year_finished, :abstract)
    end
end
