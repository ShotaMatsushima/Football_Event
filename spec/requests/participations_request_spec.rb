require 'rails_helper'

RSpec.describe "Participations", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/participations/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/participations/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
