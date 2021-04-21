class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      # 遷移先は特に記述がないのでジャンル一覧ページに遷移させます
      redirect_to request.referer
    else
      @genres = Genre.all
      render :index
    end

  end

  def edit
    @genre = genre.find(params[:id])
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end

