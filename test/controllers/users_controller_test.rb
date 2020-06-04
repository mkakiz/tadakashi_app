require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post "/login", params: {
      email: 'testuser@example.com',
      password: '123456',
    }
  end  

  test "invalid signup information" do
    post "/logout"
    binding.pry
    get "/signup"
    assert_no_difference 'User.count' do
      post "/users/create", params: {
        name: 'test',
        email: 'testuser@example',
        password: '123456',
      }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    post "/logout"
    get "/signup"
    assert_difference 'User.count', 1 do
      post "/users/create", params: {
        name: 'testz',
        email: 'testuserz@example.com',
        password: '1234567',
      }
    end
    follow_redirect!
    assert_template 'users/show'
  end

  test "unsuccessful edit" do
    get "/users/#{@user.id}/edit"
    assert_template "users/edit"
    post "/users/#{@user.id}/update", params: {
                            name:  "",
                            email: "fake@invalid",
                            password: "",
                          }
    assert_template "users/edit"
  end

end
