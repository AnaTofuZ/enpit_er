require 'test_helper'

class MeetingPlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get meeting_places_new_path
    assert_response :success
  end

end
