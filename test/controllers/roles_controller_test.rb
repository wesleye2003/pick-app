require 'test_helper'

class RolesControllerTest < ActionController::TestCase

  test "Controller should render role profile" do
    get(:show, {'id' => roles(:xyl).id})
    assert_response :success
  end

end

