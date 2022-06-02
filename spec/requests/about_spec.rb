require 'rails_helper'

RSpec.describe "Abouts", type: :request do
  describe "GET /controller" do
    it "returns http success" do
      get "/about/controller"
      expect(response).to have_http_status(:success)
    end
  end

end
