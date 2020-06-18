require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "Post Unsuccess" do
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
          content: '',
          user_id: user02.id,
        }
      }.to change(Post, :count).by(0)
    end
  end

  describe "Post Success" do
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
    end
  end

  describe "Post Edit Success" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      expect {
        post posts_create_path, params: {
          content: 'text',
          user_id: user02.id,
        }
      }.to change(Post, :count).by(1)
      get posts_index_path
      expect(response).to have_http_status(:ok)
      post = Post.find_by(content: 'text')
      post "/posts/#{post.id}/update", params: {
        content: 'text editted',
      }
      expect(response).to redirect_to "/posts/index"
      editted_post = Post.find(post.id)
      expect(post.content).not_to eq editted_post.content
    end
  end

  describe "Post Edit Unsuccess" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      expect {
        post posts_create_path, params: {
          content: 'text',
          user_id: user02.id,
        }
      }.to change(Post, :count).by(1)
      get posts_index_path
      expect(response).to have_http_status(:ok)
      post = Post.find_by(content: 'text')
      post "/posts/#{post.id}/update", params: {
        content: '',
      }
      get "/posts/#{post.id}/edit"
      expect(response).to have_http_status(:ok)
      editted_post = Post.find(post.id)
      expect(post.content).to eq editted_post.content
    end
  end

  describe "Post Delete" do
    let(:user02) { FactoryBot.create(:user02) }
    it "responds successfully" do
      post login_path, params: {
        email: user02.email,
        password: user02.password,
      }
      expect {
        post posts_create_path, params: {
          content: 'text',
          user_id: user02.id,
        }
      }.to change(Post, :count).by(1)
      get posts_index_path
      expect(response).to have_http_status(:ok)
      post = Post.find_by(content: 'text')
      expect {
        post "/posts/#{post.id}/destroy"
      }. to change(Post, :count).by(-1)
      expect(response).to redirect_to "/posts/index"
    end
  end

end

