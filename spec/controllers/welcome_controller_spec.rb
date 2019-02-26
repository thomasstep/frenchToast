require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET landing page" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET about us page" do
    it "returns http success" do
      get :about_us
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET schedule appointment page" do
    it "returns http success" do
      get :schedule
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET services offered page" do
    it "returns http success" do
      get :services
      expect(response).to have_http_status(:success)
    end
  end
end
