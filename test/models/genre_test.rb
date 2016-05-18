require 'test_helper'

class GenreTest < ActiveSupport::TestCase

  test "a new genre can be created" do
     assert_instance_of( Genre, genres(:jz))
  end

  test "data is correct in Genre" do
     assert genres(:jz).name == "Bebop"
  end

end
