class WelcomeController < ApplicationController

  def index
  end

  def services
  end

  def about_us
  end

  def my_profile
    if current_user.nil?
      redirect_to "/sign_in"

    else
      @appointments = Appointment.
      where(owner_email: current_user.email).
      where("date >= ?", Date.today.to_formatted_s )
    @cars = Car.where(email: current_user.email)
    end
  end

  def my_garage
  end

  def new_car
    @addcar_cancelled = false
    @addedcar = false

    #wanna see the most disgusting code ever?
    if params.has_key?(:vehicleVin)
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

  def admin
    if(current_user.nil? or !current_user.admin?)
      redirect_to "/not_admin"
    else
      @appointments = Appointment.all
    end
  end

end
