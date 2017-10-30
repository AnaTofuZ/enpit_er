require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_template layout: "layouts/application"
    assert_response :success
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", list_path
    assert_select "a[href=?]", signup_path

  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_template layout: "layouts/application"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", list_path
  end

end
