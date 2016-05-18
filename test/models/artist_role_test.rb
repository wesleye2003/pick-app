require 'test_helper'

class ArtistRoleTest < ActiveSupport::TestCase
  setup do
    @artist = User.new(username: "Madonna", password: "password", zipcode: "60609")
    @role = Role.new(name: "vocalist")
    @a_r = ArtistRole.new(role_id: @role.id, user_id: @artist.id )
  end

  test "a new artist role can be created" do
     assert @a_r.instance_of?(ArtistRole)
  end

  test "artist data is correct in artist-role" do
     assert @a_r.role_id == @role.id
  end

  test "role data is correct in artist-role" do
     assert @a_r.user_id == @artist.id
  end



end
