require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  setup do
    @jz = Genre.new(name: "Bebop")
  end

  test "a new genre can be created" do
     assert @jz.instance_of?(Genre)
  end

  test "data is correct in Genre" do
     assert @jz.name == "Bebop"
  end

end
