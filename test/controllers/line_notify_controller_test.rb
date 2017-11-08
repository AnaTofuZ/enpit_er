require 'test_helper'

class LineNotifyControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Jhon)
  end
  
  test "should not get authorize" do
    get authorize_path
    assert_response :success
  end
  
  test "should authorize redirect" do
    get login_path
    assert_template 'sessions/new'
    #post login_path, params: { session: { email: @user.email, password: 'Rxn302n1' } }
    # assert is_logged_in?
    # get authorize_path
    # assert_response :redirect
  end
end
