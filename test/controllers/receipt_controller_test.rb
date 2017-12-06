require 'test_helper'

class ReceiptControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get receipt_input_url
    assert_response :success
  end

  test "should get confrimate" do
    # get receipt_confrimate_url
    # assert_response :success
  end

end
