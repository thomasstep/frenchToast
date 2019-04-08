class AppointmentsController < ApplicationController

    def index
        @appointments = Appointment.all
    end
    
    def new
        @appointment = Appointment.new
    end
    
    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
      #@appointmentUpdated = false
      @appointment = Appointment.find(params[:id])

      if @appointment.update_attributes!(appointment_params)
          #@appointmentUpdated = true
          redirect_to "/admin"
      end
    end

    def appointment_params
        params.require(:appointment).permit(:date, :time)
    end
    
end
