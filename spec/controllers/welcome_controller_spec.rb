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
        )
      user.save!
      sign_in user
      controller.schedule
      expect(assigns(:user_email)).to eq("test@gmail.com")
      expect(assigns(:user_first_name)).to eq("John")
      expect(assigns(:user_last_name)).to eq("Test")
      expect(assigns(:user_phone)).to eq("5555551230")
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

  describe "Check that cars can be deleted from the my_profile page" do
    it "should be able to delete a car after creating it" do
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
      controller.should_receive(:redirect_to).with("/my_profile")
      expect do
        controller.params[:id] = controller.params[:vehicleVin]
        controller.delete_car
      end.to change(Car, :count).by(-1)
    end
  end

end
