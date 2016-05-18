require 'test_helper'

class GenreSelectionTest < ActiveSupport::TestCase
  setup do
    @artist = User.new(username: "Madonna", password: "password", zipcode: "60609")
    @genre = Genre.new(name: "chant")
    @g_s = GenreSelection.new(genre_id: @genre.id, user_id: @artist.id )
  end

  test "a new genre selection can be created" do
     assert @g_s.instance_of?(GenreSelection)
  end

  test "genre data is correct in genre selection" do
     assert @g_s.genre_id == @genre.id
  end

  test "artist data is correct in artist-role" do
     assert @g_s.user_id == @artist.id
  end


  # test "genre selections are properly assigned to artists" do
  #   assert @artist.genre_selections.count == 1
  # end


end
