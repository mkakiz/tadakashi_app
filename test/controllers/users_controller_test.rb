require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get "/signup"
    assert_no_difference 'User.count' do
      post "/users/create", params: {
        name: 'test',
        email: 'testuser@example',
        password: '123456',
      }
    end
  end

  test "valid signup information" do
    get "/signup"
    assert_difference 'User.count', 1 do
      post "/users/create", params: {
        name: 'testz',
        email: 'testuserz@example.com',
        password: '1234567',
      }
    end
  end


end
