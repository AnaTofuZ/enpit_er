require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_profile_url
    assert_response :success
  end

end
