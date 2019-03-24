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

  describe "Check scheduling when email param is present" do
    it "should populate only the fields that have params" do
      controller.params[:email] = "rspec@gmail.com"
      controller.params[:phone] = "5555551234"
      controller.params[:vehicleYear] = "2001"
      controller.params[:vehicleMake] = "Mazda"
      controller.params[:vehicleModel] = "3"
      controller.params[:vehicleVin] = "12890"
      controller.params[:desiredDate] = "2019-03-27"
      controller.params[:desiredTime] = "Morning"
      controller.params[:reason] = "Testing"
      controller.schedule
      expect(assigns(:appointment_scheduled)).to eq(true)
    end
  end

  describe "Check scheduling when email param is not present" do
    it "should populate only the fields that have params" do
      controller.params[:email] = "rspec@gmail.com"
      controller.schedule
      expect(assigns(:appointment_canceled)).to eq(true)
    end
  end

  describe "Test that the scheduling fields are filled in appropriately" do
    it "should fill in name, phone, and email if there" do
      user = User.new(
          :email => "test@gmail.com",
          :password => "test1234",
          :phone => "5555551230",
          :first_name => "John",
          :last_name => "Test"
        ).save!
      sign_in user
      controller.schedule
      expect(assigns(:user_email)).to eq("test@gmail.com")
      expect(assigns(:user_first_name)).to eq("John")
      expect(assigns(:user_last_name)).to eq("Test")
      expect(assigns(:user_phone)).to eq("5555551230")
    end
  end
end
