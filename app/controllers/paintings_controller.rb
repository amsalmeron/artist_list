class PaintingsController < ApplicationController
  def index
    @paintings = Painting.where(abstract: true)
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    painting = Painting.find(params[:id])
    painting.update(painting_params)
    redirect_to "/paintings/#{painting.id}"
  end

  private

    def painting_params
      params.permit(:name, :year_finished, :abstract)
    end
end
