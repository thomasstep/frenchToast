class AppointmentsController < ApplicationController
    
    def edit
        @appointment = Appointment.find(params[:id])
    end
    
    def update
        @appointment = Appointment.find(params[:id])
        
        if @appointment.update_attributes!(appointment_params)
            redirect_to admin_path
        end
    end
    
    def appointment_params
        params.require(:appointment).permit(:date, :time, :parts_needed, :hours_needed, :cost)
    end

end