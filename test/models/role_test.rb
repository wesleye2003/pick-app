require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "a new role can be created" do
    assert_instance_of( Role, roles(:xyl))
  end

  test "data is correct in role" do
     assert roles(:xyl).name == "xylophonist"
  end

end
