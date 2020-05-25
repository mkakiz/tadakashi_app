require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    post "/login", params: {
      email: 'aaa@bbb.com',
      password: '123456',
      image_name: "default_user.jpg"
    }
    get "/posts/index"
    assert_response :success
  end
end
