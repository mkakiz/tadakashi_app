require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'response code is 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'to render new template' do
      expect(response).to render_template :new
    end

    it 'new user object is passed to view file' do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do
    context 'right user infor is passed' do
      let(:params) do
        { user: {
            name: 'user',
            password: 'password',
            password_confirmation: 'password',
          }
        }
      end

      it 'a user is added' do
        expect { post :create, params: params }.to change(User, :count).by(1)
      end
    end
  end
end


