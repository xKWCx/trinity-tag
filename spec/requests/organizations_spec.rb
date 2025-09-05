require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  describe "GET /organizations" do
    it "returns http success" do
      get organizations_path
      expect(response).to have_http_status(:success)
    end
  end
end
