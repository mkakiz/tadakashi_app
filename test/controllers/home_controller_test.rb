require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_path
    assert_response :success
  end
end
