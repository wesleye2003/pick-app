require 'test_helper'

class SearchedRolesControllerTest < ActionController::TestCase

  test "controller should create a searched role" do
    assert_difference('SearchedRole.count') do
     post :create, {
        :user_id => users(:jimi).id,
        :id => roles(:xyl).id
      }
      end
    # assert_redirected_to post_path(assigns(:post))
    end
end

# post :create, story: @story.attributes, user_id: @user.id