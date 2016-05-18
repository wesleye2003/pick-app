require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "Controller should render user profile" do
    get(:show, {'id' => users(:mick).id})
    assert_response :success
    # assert_not_nil assigns(:posts)
  end




end
