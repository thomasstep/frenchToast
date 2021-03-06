class Search < ApplicationRecord
    
    def search_appointments
        appointments = Appointment.all
        appointments = appointments.where("first_name LIKE ?", first_name.capitalize) if first_name.present?
        appointments = appointments.where("last_name LIKE ?", last_name.capitalize) if last_name.present?
        appointments = appointments.where("phone = ?", phone) if phone.present?
        appointments = appointments.where('"VIN" = ?', self.VIN) if self.VIN.present?
        appointments = appointments.where("owner_email LIKE ?", email) if email.present?
        appointments = appointments.where("date >= ?", after_date) if after_date.present?
        appointments = appointments.where("date <= ?", before_date) if before_date.present?
        if (!(time=="Any"))
            appointments = appointments.where("time LIKE ?", self.time) if self.time.present?
        end
        
        return appointments.order({:date => :asc})
    end
end
