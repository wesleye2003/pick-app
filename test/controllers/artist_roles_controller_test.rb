require 'test_helper'

class ArtistRolesControllerTest < ActionController::TestCase
  test "controller should create an artist / role" do
    assert_difference('ArtistRole.count') do
     post :create, {
        :user_id => users(:jimi).id,
        :id => roles(:xyl).id
      }
      end
    # assert_redirected_to post_path(assigns(:post))
    end
end
