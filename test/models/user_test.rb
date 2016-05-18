require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "zip code is required" do
     assert_not users(:mick).save
  end

  # test "password is required" do
  #   @keith = User.new(username: "Keith Richards", zipcode: "60606")
  #    assert_not @keith.save
  # end

  test "confirms class" do
        assert User.new.class == User
  end

  test "takes three parameters and returns a User object" do
        assert_instance_of(User, users(:jimi))
  end


end
