class AppointmentsController < ApplicationController

  def new
    @user_first_name = ""
    @user_last_name = ""
    @user_email = ""
    @user_phone = ""
    if user_signed_in?
      if !current_user.email.nil?
        @user_email = current_user.email
      end
      if !current_user.first_name.nil?
        @user_first_name = current_user.first_name
      end
      if !current_user.last_name.nil?
        @user_last_name = current_user.last_name
      end
      if !current_user.phone.nil?
        @user_phone = current_user.phone
      end
    end
    @appointment = Appointment.new
  end

  def create
    if appointment_params[:time] == 1
      appointment_params[:time] = "Morning"
    elsif appointment_params[:time] == 2
      appointment_params[:time] = "Afternoon"
    elsif appointment_params[:time] == 3
      appointment_params[:time] = "Evening"
    end
    
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to '/my_profile'
    else
      render :new
    end
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
    params.require(:appointment).permit(:first_name, :last_name, :owner_email, :phone, :year, :make, :model, :VIN, :time, :date, :reason)
  end

  def update_appointment_params
    params.require(:appointment).permit(:date, :time)
  end

end
