require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

end
