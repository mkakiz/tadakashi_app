require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  post "/login", params: {user: {
    email:    users(:one).email,
    password: users(:one).password
  }}
  test "should get post" do
    get "/posts/:id"
    assert_response :success
  end
end
