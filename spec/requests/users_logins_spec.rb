require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "Pages by LoggedIn User" do
    let(:user) { FactoryBot.create(:user) }
    it "responds successfully" do
      post login_path, params: {
        email: user.email,
        password: user.password,
      }
      expect(user).to be_valid
      expect(response).to have_http_status(:redirect)
      get posts_index_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Login Failure" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: '',
      }
      expect(user02).to be_valid
      get "/login"
      expect(response).to have_http_status(:ok)
    end
  end

end
