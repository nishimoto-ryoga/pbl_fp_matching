require 'rails_helper'

RSpec.describe "Planners", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/planners/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/planners/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
