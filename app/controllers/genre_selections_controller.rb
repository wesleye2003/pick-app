class GenreSelectionsController < ApplicationController

  def create
    genre = Genre.find(params[:genre_id])
    current_user.genres << genre
  end

  def destroy
    genre = Genre.find(params[:id])
    artist_genre = current_user.artist_genres.find_by(:genre_id)
    artist_genre.destroy
  end

end
