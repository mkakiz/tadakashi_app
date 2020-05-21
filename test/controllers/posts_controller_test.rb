require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    post "/login", params: {user: {
     name: users(:one).name,
     email:  users(:one).email,
     password_digest: users(:one).password_digest
    }}
    get "/posts/:id"
    assert_response :success
  end
end
