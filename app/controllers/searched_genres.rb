class SearchedGenresController < ApplicationController
  def create
    artist = User.find(params[:id])
    artist_genre = SearchedGenre.find_or_create_by(genre_id: params[:id], user_id: params[:user_id])
    message = {'status' => 'Changes Saved Successfully.'}
    render :json => message
  end

  def destroy
    artist = User.find(params[:id])
    user_searched_genres = artist.searched_genres
    if user_searched_genres
      user_searched_genres.destroy_all
      message = {'status' => 'Genres erased successfully.'}
    else
      400
      message = {'status' => 'Genres not erased!'}
    end
    render :json => message
  end
end
