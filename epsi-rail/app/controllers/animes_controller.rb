class AnimesController < ApplicationController
  def index
    @animes = Anime.all.order(:created_at).reverse_order
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def create
    @anime = Anime.new(anime_params)

    if @anime.save
      redirect_to animes_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  def anime_params
    params.require(:anime).permit(:title)
  end

end
