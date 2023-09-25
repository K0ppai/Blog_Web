require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts, ' do
    before :each do
      get '/users/:user_id/posts'
    end

    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response body should include the correct placeholder test' do
      expect(response.body).to include('Posts#index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'should returns http success' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'the response body should include the correct placeholder test' do
      expect(response.body).to include('Show post id')
    end
  end
end
