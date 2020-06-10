require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "pages by login user" do
    #it "responds successfully" do
    #  get :index
    #  expect(response).to_not be_success
    #end

    it "responds successfully" do
      post "/login", params: {
        email: 'testuserx@examplex.com',
        password: '123456',
      }
      get :new
      expect(response).to be_success
    end
  end








end
