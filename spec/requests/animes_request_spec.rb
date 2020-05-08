require 'rails_helper'

RSpec.describe "Animes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/animes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/animes/show"
      expect(response).to have_http_status(:success)
    end
  end

end
