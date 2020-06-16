require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "pages by login user" do
    let(:user) { FactoryBot.create(:user) }
    it "responds successfully" do
      post login_path, params: {
        email: user.email,
        password: user.password,
      }
      user.valid?
      expect(user).to be_valid
      expect(response).to have_http_status(:redirect)
      get posts_index_path
      expect(response).to have_http_status(:ok)
    end
  end
end
