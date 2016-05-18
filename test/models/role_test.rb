require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  setup do
    @xyl = Role.new(name: "xylophonist")
  end

  test "a new role can be created" do
     assert @xyl.instance_of?(Role)
  end

  test "data is correct in role" do
     assert @xyl.name == "xylophonist"
  end

end
