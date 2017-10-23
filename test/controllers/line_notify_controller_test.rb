require 'test_helper'

class LineNotifyControllerTest < ActionDispatch::IntegrationTest
  test "should get authorize" do
    get line_notify_authorize_url
    assert_response :success
  end

end
