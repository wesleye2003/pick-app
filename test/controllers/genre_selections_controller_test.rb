require 'test_helper'

class GenreSelectionsControllerTest < ActionController::TestCase
  test "controller should create an genre selection" do
    assert_difference('GenreSelection.count') do
     post :create, {
        :user_id => users(:jimi).id,
        :id => genres(:jz).id
      }
      end
    # assert_redirected_to post_path(assigns(:post))
    end
end
