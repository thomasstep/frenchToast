class WelcomeController < ApplicationController

  def index
    @teamName = "French Toast"
  end

  def services
    
  end

  def about_us
  	@greeting = "The Z Center"
  end

  def schedule

    @schedule = Appointment.all
    #wanna see the most disgusting code ever?

    @email = params[:email]
    @phone = params[:phone]
    @vehicleYear = params[:vehicleYear]
    @vehicleMake = params[:vehicleMake]
    @vehicleModel = params[:vehicleModel]
    @vehicleVin = params[:vehicleVin]
    @desiredDate = params[:desiredDate]
    @desiredTime = params[:desiredTime]
    @reason = params[:reason]
    
    app = Appointment.new(owner_email: @email, VIN: @vehicleVin, date: @desiredDate,time: @desiredTime, reason: @reason, )
    if app.valid? 
        app.save
    else
      #do something, maybe flash an error
    end
    
    print 

  end
  
  def my_profile
    
  end
end
