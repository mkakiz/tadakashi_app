require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it "responds successfully" do
    get :top
    get :about
    expect(response).to be_success
  end


end
