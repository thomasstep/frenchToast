class AppointmentsController < ApplicationController

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
      #@appointmentUpdated = false
      @appointment = Appointment.find(params[:id])
      #if !params[:date].present?
       # params[:date] = Date.current
        #@appointment.date = Date.current
      #end
      if @appointment.update_attributes!(appointment_params)
          #@appointmentUpdated = true
          redirect_to "/admin"
      end
    end

    def appointment_params
        params.require(:appointment).permit(:date, :time, :parts_needed, :hours_needed, :cost)
    end

end
