class Search < ApplicationRecord
    def search_appointments
        appointments = Appointment.all
        #appointments = appointments.where("VIN LIKE ?", VIN) if VIN.present? gives error
        appointments = appointments.where("owner_email LIKE ?", email) if email.present?
        appointments = appointments.where("date >= ?", after_date) if after_date.present?
        appointments = appointments.where("date <= ?", before_date) if before_date.present?
        appointments = appointments.where("time LIKE ?", time) if time.present?
        
        return appointments
    end
end
