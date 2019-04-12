require 'rails_helper'

RSpec.describe CarsController, type: :controller do

  describe "Check that cars can be created" do
    it "should be able to create a car" do
      user = User.new(
          :email => "test@gmail.com",
          :password => "test1234",
          :phone => "5555551230",
          :first_name => "John",
          :last_name => "Test"
        )
      user.save!
      sign_in user
      params = {
        car: {
          year: "1990",
          make: "Toyota",
          model: "Corolla",
          VIN: "12345678901234567"        }
      }
      post :create, params: params
      expect(response).to redirect_to("/my_profile")
    end
  end

  describe "Check that cars will not be creating with missing params" do
    it "should not create a car without an email" do
      user = User.new(
          :email => "test@gmail.com",
          :password => "test1234",
          :phone => "5555551230",
          :first_name => "John",
          :last_name => "Test"
        )
      user.save!
      sign_in user
      params = {
        car: {
          year: "1990",
          make: "Toyota",
          model: "Corolla",
        }
      }
      post :create, params: params
      expect(response).to render_template(:new)
    end
  end

  describe "Destroy should actually destroy" do
    it "should reduce car count by 1" do
      car = Car.new(
        :year => "1990",
        :make => "Toyota",
        :model => "Corolla",
        :VIN => "12345678901234567",
        :email => "test@gmail.com"
      )
      car.save!
      params = {
        id: "12345678901234567"
      }
      expect do
        post :destroy, params: params
        expect(response).to redirect_to("/my_profile")
      end.to change(Car, :count).by(-1)
    end
  end

end
