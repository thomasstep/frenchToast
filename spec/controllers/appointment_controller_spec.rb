require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  describe "GET schedule appointment page" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "Check that edit brings up the correct appointment" do
    it "should be able to assign appointment the newly created appointment" do
      appt = Appointment.new(
          :VIN => "12345678901234567",
          :owner_email => "rspec@gmail.com",
          :date => "2019-04-04",
          :time => "Evening",
          :reason => "purely testing"
        )
      appt.save!
      # There should only be one appointment which is the one we just created
      id = Appointment.first.id
      controller.params[:id] = id
      controller.edit
      expect(assigns(:appointment)).to eq(appt)
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
      controller.new
      expect(assigns(:user_email)).to eq("test@gmail.com")
      expect(assigns(:user_first_name)).to eq("John")
      expect(assigns(:user_last_name)).to eq("Test")
      expect(assigns(:user_phone)).to eq("5555551230")
    end
  end

  # describe "Check that update brings you back to admin page" do
  #   it "should be able to look for update attributes" do
  #     appt = Appointment.new(
  #         :VIN => "12345678901234567",
  #         :owner_email => "rspec@gmail.com",
  #         :date => "2019-04-04",
  #         :time => "Evening",
  #         :reason => "purely testing"
  #       )
  #     appt.save!
  #     id = Appointment.first.id
  #     controller.params[:id] = id
  #     controller.params[:appointment] = {:time => "Morning", :date => "2019-04-04"}
  #     print("good luck")
  #     expect(controller.update).to redirect_to(admin_path)
  #     expect(Appointment.first[:time]).to eq("Morning")
  #   end
  # end

  describe "Check that creating an appointment redirects to my_profile" do
    it "should create appointment when correct fields are present and redirect to my profile" do
      params = {
        appointment: {
          first_name: "John",
          last_name: "Test",
          owner_email: "rspec@gmail.com",
          phone: "5555551232",
          year: "1990",
          make: "Toyota",
          model: "Supra",
          VIN: "12345678901234567",
          date: "2040-01-01",
          time: "1",
          reason: "Rspec testing"
        }
      }
      post :create, params: params
      #controller.create
      expect(response).to redirect_to("/my_profile")
      time = Appointment.first.time
      expect(time).to eq("Morning")
    end
  end

  describe "Check that creating an appointment redirects to my_profile" do
    it "should create appointment when correct fields are present and redirect to my profile" do
      params = {
        appointment: {
          first_name: "John",
          last_name: "Test",
          owner_email: "rspec@gmail.com",
          phone: "5555551232",
          year: "1990",
          make: "Toyota",
          model: "Supra",
          VIN: "12345678901234567",
          date: "2040-01-01",
          time: "2",
          reason: "Rspec testing"
        }
      }
      post :create, params: params
      #controller.create
      expect(response).to redirect_to("/my_profile")
      time = Appointment.first.time
      expect(time).to eq("Afternoon")
    end
  end

  describe "Check that creating an appointment redirects to my_profile" do
    it "should create appointment when correct fields are present and redirect to my profile" do
      params = {
        appointment: {
          first_name: "John",
          last_name: "Test",
          owner_email: "rspec@gmail.com",
          phone: "5555551232",
          year: "1990",
          make: "Toyota",
          model: "Supra",
          VIN: "12345678901234567",
          date: "2040-01-01",
          time: "3",
          reason: "Rspec testing"
        }
      }
      post :create, params: params
      #controller.create
      expect(response).to redirect_to("/my_profile")
      time = Appointment.first.time
      expect(time).to eq("Evening")
    end
  end

  describe "Check that a bad form submission results in going back to new" do
    it "should create appointment when correct fields are present and redirect to my profile" do
      params = {
        appointment: {
          first_name: "John",
          last_name: "Test",
          owner_email: "rspec@gmail.com",
          phone: "5555551232",
          year: "1990",
          make: "Toyota",
          model: "Supra",
          VIN: "12345678901234567",
          date: "2040-01-01"
        }
      }
      post :create, params: params
      expect(response).to render_template(:new)
    end
  end

  describe "Destroy should actually destroy" do
    it "should reduce appointment count by 1" do
      appt = Appointment.new(
        :first_name => "John",
        :last_name => "Test",
        :owner_email => "rspec@gmail.com",
        :phone => "5555551232",
        :year => "1990",
        :make => "Toyota",
        :model => "Supra",
        :VIN => "12345678901234567",
        :date => "2040-01-01",
        :time => "3",
        :reason => "Rspec testing"
      )
      appt.save!
      apptId = Appointment.first.id
      params = {
        id: apptId
      }
      expect do
        post :destroy, params: params
        expect(response).to redirect_to("/my_profile")
      end.to change(Appointment, :count).by(-1)
    end
  end

  describe "GET show" do
    it "assigns the requested appointment as @appointment" do
      appt = Appointment.new(
          :VIN => "12345678901234567",
          :owner_email => "rspec@gmail.com",
          :date => "2019-04-04",
          :time => "Evening",
          :reason => "purely testing"
        )
      appt.save!
      params = {
        :id => appt.to_param
      }
      get :show, params: params
      expect(assigns(:appointment)).to eq appt
    end
  end

  describe "POST update" do
    it "correctly changes the appointment" do
      appt = Appointment.new(
          :VIN => "12345678901234567",
          :owner_email => "rspec@gmail.com",
          :date => "2019-04-04",
          :time => "Evening",
          :reason => "purely testing"
        )
      appt.save!
      expect(appt.time).to eq "Evening"
      params = {
        :id => appt.to_param,
        appointment: {
          time: "Morning"
        }
      }
      post :update, params: params
      updated = Appointment.first
      expect(updated.time).to eq "Morning"
    end
  end
end
