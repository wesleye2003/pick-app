class GenreSelectionsController < ApplicationController

  def create
    artist_genre = GenreSelection.find_or_create_by(genre_id: params[:id], user_id: params[:user_id])
    message = {'status' => 'Changes Saved Successfully.'}
    render :json => message
  end

  def destroy
    artist = User.find(params[:id])
    artist_genres = artist.genre_selections
    if artist_genres
      artist_genres.destroy_all
      message = {'status' => 'Genres erased successfully.'}
    else
      400
      message = {'status' => 'Genres not erased!'}
    end
    render :json => message
  end

end
