require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
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
end
