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
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      # ジャンル変更保存後 ジャンル一覧ページに遷移させます
      redirect_to admin_genres
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end

