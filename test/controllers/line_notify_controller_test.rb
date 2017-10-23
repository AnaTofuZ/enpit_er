require 'test_helper'

class LineNotifyControllerTest < ActionDispatch::IntegrationTest
  test "should get authorize" do
     get authorize_path
    assert_response :redirect
  end

end
