class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new
    @genre.save
      # 遷移先は特に記述がないのでジャンル一覧ページに遷移させます
     redirect_to request.referer
  end

  def edit
  end

  def update
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:genre_id, :name)
  end
  
end

