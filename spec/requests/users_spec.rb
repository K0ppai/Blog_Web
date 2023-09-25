require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/:id" do
    it "returns http success" do
      get '/users/:id'
      expect(response.status).to eq(200)
    end
  end
end
