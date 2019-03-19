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
    @cars = Car.where(email: current_user.email)
  end
  
  def my_garage
    
  end
  
  def new_car
    @addcar_cancelled = false
    @addedcar = false
    @new_car = Car.all

    #wanna see the most disgusting code ever?
    if params.has_key?(:vehicleVin)
      @email = params[:email]
      @vehicleYear = params[:vehicleYear]
      @vehicleMake = params[:vehicleMake]
      @vehicleModel = params[:vehicleModel]
      @vehicleVin = params[:vehicleVin]

      @new = Car.new(email: current_user.email, year: @vehicleYear, VIN: @vehicleVin, make: @vehicleMake, model: @vehicleModel)
      if @new.valid?
        @addedcar = true
        @new.save

      else
        flash[:notice] = "Unable to add car"
        @addcar_cancelled = true

      end
    end
  end
end
