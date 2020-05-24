require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    post "/login", params: {user: {
      email: 'testuser@example.com',
      password: '123456'
    }}
    get "/posts/index"
    assert_response :success
  end
end
