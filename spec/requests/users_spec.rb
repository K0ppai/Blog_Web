require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /, ' do
    before :each do
      get '/'
    end

    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response body should include the correct placeholder test' do
      expect(response.body).to include('This is index page')
    end
  end

  describe 'GET /users/:id' do
    before :each do
      get '/users/:id'
    end

    it 'should returns http success' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'the response body should include the correct placeholder test' do
      expect(response.body).to include('Show params')
    end
  end
end
