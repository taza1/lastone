require 'test_helper'

class BikeControllerTest < ActionDispatch::IntegrationTest
  test "should get bikes" do
    get bike_bikes_url
    assert_response :success
  end

end
