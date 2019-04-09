class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    #@appointmentUpdated = false
    @appointment = Appointment.find(params[:id])

    if @appointment.update_attributes!(update_appointment_params)
      #@appointmentUpdated = true
      redirect_to "/admin"
    end
  end

  def appointment_params
    params.require(:appointment).permit(:first_name)
  end

  def update_appointment_params
    params.require(:appointment).permit(:date, :time)
  end

end
