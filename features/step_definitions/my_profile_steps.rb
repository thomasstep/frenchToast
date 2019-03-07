Given /^an appointment has been made with email "(.*)", VIN "(.*)", date "(.*)", time "(.*)", and reason "(.*)"$/ do | email, vin, date, time, reason |
  Appointment.new(
    :owner_email => email,
    :VIN => vin,
    :date => date,
    :time => time,
    :reason => reason
  ).save!
end
