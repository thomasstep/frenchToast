require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #AboutUs" do
    it "returns http success" do
      get :AboutUs
      expect(response).to have_http_status(:success)
    end
  end

end
