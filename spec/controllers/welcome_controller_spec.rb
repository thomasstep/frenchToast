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

  describe "GET services offered page" do
    it "returns http success" do
      get :services
      expect(response).to have_http_status(:success)
    end
  end

  describe "Check that the new_car page only makes a new car if the necessary information is provided" do
    it "should not allow a new car addition while missing the VIN" do
      user = User.new(
          :email => "test@gmail.com",
          :password => "test1234",
          :phone => "5555551230",
          :first_name => "John",
          :last_name => "Test"
        )
      user.save!
      sign_in user
      controller.params[:vehicleYear] = "2001"
      controller.params[:vehicleMake] = "Ford"
      controller.params[:vehicleModel] = "Model T"
      controller.params[:vehicleVin] = ""
      controller.new_car
      expect(assigns(:addcar_cancelled)).to eq(true)
    end
  end

  describe "Check that cars can be created if fields are properly filled out" do
    it "should be able to delete create a car" do
      user = User.new(
          :email => "test@gmail.com",
          :password => "test1234",
          :phone => "5555551230",
          :first_name => "John",
          :last_name => "Test"
        )
      user.save!
      sign_in user
      controller.params[:vehicleYear] = "2001"
      controller.params[:vehicleMake] = "Ford"
      controller.params[:vehicleModel] = "Model T"
      controller.params[:vehicleVin] = "00000000000000001"
      controller.new_car
      expect(Car.find_by_model("Model T").nil?).to eq(false)
    end
  end

end
