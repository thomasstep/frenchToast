class UserMailer < ApplicationMailer
    def welcome_email(email, date, time)
        @email = email
        @date = date
        @time = time
        mail(to: @email, subject: 'Appointment Confirmation at The Z Center')
    end
end
