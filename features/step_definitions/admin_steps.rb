When /^I edit appointment (.*)$/ do |appt|
  edit_appointment_path(appt)
end

When /^I change appointment to "(.*)" and "(.*)"$/ do |date, time|
  find_by_id("appointmentDate").set(date)
  find_by_id("appointmentTime").set(time)
end
