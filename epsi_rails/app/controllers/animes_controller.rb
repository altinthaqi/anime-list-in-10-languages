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

  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    @anime = Anime.find(params[:id])

    if @anime.update(anime_params)
      redirect_to animes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @anime = Anime.find(params[:id])
    @anime.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
  def anime_params
    params.require(:anime).permit(:title)
  end

end
