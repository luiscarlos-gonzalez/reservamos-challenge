require 'rails_helper'

RSpec.describe "Cities", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/cities/create"
      expect(response).to have_http_status(:success)
    end
  end

end
