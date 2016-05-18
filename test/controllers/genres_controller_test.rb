require 'test_helper'

class GenresControllerTest < ActionController::TestCase

  test "Controller should render genre profile" do
    get(:show, {'id' => genres(:jz).id})
    assert_response :success
  end


end
