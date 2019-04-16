class AppointmentsController < ApplicationController
  
  def load_forms
  
    @current_time = Time.now.strftime('%Y-%m-%d')
    @user_first_name = ""
    @user_last_name = ""
    @user_email = ""
    @user_phone = ""
    if user_signed_in?
      if !current_user.email.blank?
        @user_email = current_user.email
      end
      
      if !current_user.first_name.blank?
        @user_first_name = current_user.first_name
      end
      
      if !current_user.last_name.blank?
        @user_last_name = current_user.last_name
      end
      
      if !current_user.phone.blank?
        @user_phone = current_user.phone
      end
      
      @show_saved_cars = true
      @cars = [["Use New Car", "0"]]
      saved_cars = Car.where(email: current_user.email)
      saved_cars.each do |car|
        @cars.push(["#{car.year} #{car.make} #{car.model}", car.VIN])
      end
    end
  end
  
  def new
    load_forms
    @appointment = Appointment.new
  end

  def create
  
    if params[:appointment][:time] == "1"
      params[:appointment][:time] = "Morning"
    elsif params[:appointment][:time] == "2"
      params[:appointment][:time] = "Afternoon"
    elsif params[:appointment][:time] == "3"
      params[:appointment][:time] = "Evening"
    end

    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      UserMailer.welcome_email(params[:appointment][:owner_email], params[:appointment][:date], params[:appointment][:time]).deliver_now
      redirect_to '/my_profile'
    else
      load_forms
      render :new
    end
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    @appointment = Appointment.find(params[:id]).destroy
    redirect_to "/my_profile"
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
    params.require(:appointment).permit(:date, :time, :parts_needed, :hours_needed, :cost)
  end
end
