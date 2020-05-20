require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    post user_session_path, params: {user: {
      email:    users(:one).email,
      password: users(:one).password
    }}    
    get "/posts/:id"
    assert_response :success
  end
end
