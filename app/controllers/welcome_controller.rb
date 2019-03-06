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
    @firstName = params[:firstName]
    @lastName = params[:lastName]
    print @firstName
    print @lastName
  end
  
  def my_profile
    
  end
  
  def new_car
    
  end
end
