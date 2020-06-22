require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "Comment Success" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      get posts_index_path
      expect(response).to have_http_status(:ok)
      expect {
        post posts_create_path, params: {
          content: 'text',
          user_id: user02.id,
        }
      }.to change(Post, :count).by(1)
      post = Post.find_by(content: 'text')
      expect {
        post comments_path, params: {
          comment: {
            comment: 'koment',
            post_id: post.id,
            name: 'name',
            user_id: user02.id,
          }
        }
      }.to change(Comment, :count).by(1)
    end
  end

  describe "Comment Unsuccess" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      get posts_index_path
      expect(response).to have_http_status(:ok)
      expect {
        post posts_create_path, params: {
          content: 'text',
          user_id: user02.id,
        }
      }.to change(Post, :count).by(1)
      post = Post.find_by(content: 'text')
      expect {
        post comments_path, params: {
          comment: {
            comment: '',
            post_id: post.id,
            name: '',
            user_id: user02.id,
          }
        }
      }.to change(Comment, :count).by(0)
    end
  end


end
