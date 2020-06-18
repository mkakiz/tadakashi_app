require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    let(:user) { FactoryBot.create(:user) }
    it "responds successfully" do
      post login_path, params: {
        email: user.email,
        password: user.password,
      }
      get posts_index_path
      expect(response).to have_http_status(:ok)
      expect {
        post posts_create_path, params: {
          content: 'text',
          user_id: user.id,
        }
      }.to change(Post, :count).by(1)
    end
  end
end
