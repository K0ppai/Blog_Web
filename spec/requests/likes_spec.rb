require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'GET /_new' do
    it 'returns http success' do
      get '/likes/_new'
      expect(response).to have_http_status(:success)
    end
  end
end
