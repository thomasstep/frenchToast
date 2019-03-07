class WelcomeController < ApplicationController

  def index
    @teamName = "French Toast"
    flash[:alert] = "hey"
  end

  def services

  end

  def about_us
  	@greeting = "The Z Center"
  end

  def schedule
    @appointment_canceled = false
    @appointment_scheduled = false
    @schedule = Appointment.all

    #wanna see the most disgusting code ever?
    if params.has_key?(:email)
      @email = params[:email]
      @phone = params[:phone]
      @vehicleYear = params[:vehicleYear]
      @vehicleMake = params[:vehicleMake]
      @vehicleModel = params[:vehicleModel]
      @vehicleVin = params[:vehicleVin]
      @desiredDate = params[:desiredDate]
      @desiredTime = params[:desiredTime]
      @reason = params[:reason]

      @app = Appointment.new(owner_email: @email, VIN: @vehicleVin, date: @desiredDate, time: @desiredTime, reason: @reason )
      if @app.valid?
        @appointment_scheduled = true
        @app.save

      else
        flash[:notice] = "Unable to create appointment"
        @appointment_canceled = true

      end
    end
  end

  def my_profile
    @appointments = Appointment.where(owner_email: current_user.email)
    puts @appointment.class
  end
end
