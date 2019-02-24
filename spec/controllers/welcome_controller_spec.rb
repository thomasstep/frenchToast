require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #AboutUs" do
    it "returns http success" do
      get :about_us
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET landing page" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
