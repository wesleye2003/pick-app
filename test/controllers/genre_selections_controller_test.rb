require 'test_helper'

class GenreSelectionsControllerTest < ActionController::TestCase
  test "controller should create an genre selection" do
    assert_difference('GenreSelection.count') do
     post :create, {
        :user_id => users(:gaga).id,
        :id => genres(:jz).id
      }
      end
    # assert_redirected_to post_path(assigns(:post))
    end

  test "test should destroy a genre selection" do
    p users(:jimi).genre_selections.count
    assert_difference('GenreSelection.count', -1) do
      delete :destroy, :id => users(:jimi).id
    end
  end


end
