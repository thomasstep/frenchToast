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
        where("date >= ?", Date.today.to_formatted_s ).
        order({:date => :asc})
      @cars = Car.where(email: current_user.email)
    end
  end

  def admin
    if(current_user.nil? or !current_user.admin?)
      redirect_to "/not_admin"
    else
      @appointments = Appointment.all
      @current_appointments = @appointments.where("date LIKE ? AND date >= ?","%#{params[:search]}%", Date.current)
      @previous_appointments = @appointments.where("date LIKE ? AND date < ?","%#{params[:search]}%", Date.current)
    end
  end

end
