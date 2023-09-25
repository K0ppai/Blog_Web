require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /" do
    before :each do
      get "/"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "render the correct template" do
      expect(response).to render_template(:index)
    end
  end
  
  describe "GET /users/:id" do
    before :each do
      get "/users/:id"
    end
    
    it "returns http success" do
      expect(response.status).to eq(200)
    end

    it "render the correct template" do
      expect(response).to render_template(:show)
    end
  end
end
