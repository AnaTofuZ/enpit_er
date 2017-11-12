require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit_items" do
    get items_edit_items_url
    assert_response :success
  end

end
