require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "zip code is required" do
    @mick = User.new(username: "Mick Jagger", password: "password")
     assert_not @mick.save
  end

  test "password is required" do
    @keith = User.new(username: "Keith Richards", zipcode: "60606")
     assert_not @keith.save
  end

  test "confirms class" do
        assert User.new.class == User
  end

  test "takes three parameters and returns a User object" do
    @jimi = User.new(username: "Jimi Hendrix", zipcode: "60622", password: "password")
        assert @jimi.instance_of?(User) == true
  end


end
