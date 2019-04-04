require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
    describe 'welcome_email' do
        appt = Appointment.new(
            :owner_email => "rspec@gmail.com",
             :date => "2019-03-27",
             :time => "Morning"
        )
        let(:mail) {described_class.welcome_email(appt.owner_email, appt.date, appt.time).deliver_now}
      
        it 'renders the subject' do
            expect(mail.subject).to eq('Appointment Confirmation at The Z Center')
        end
        
        it 'renders the receiver email' do
            expect(mail.to).to eq([appt.owner_email])
        end

        it 'renders the sender email' do
            expect(mail.from).to eq(['thezcenterhouston@gmail.com'])
        end

        it 'assigns @time' do
            expect(mail.body.encoded).to match(appt.time)
        end
    end
  
    describe 'welcome_email' do
        appt = Appointment.new(
            :owner_email => "rspec@gmail.com",
             :date => "2019-03-27",
             :time => "Morning"
        )
        let(:mail) {described_class.reminder_email(appt.owner_email, appt.date, appt.time).deliver_now}
      
        it 'renders the subject' do
            expect(mail.subject).to eq('Appointment Reminder')
        end
        
        it 'renders the receiver email' do
            expect(mail.to).to eq([appt.owner_email])
        end

        it 'renders the sender email' do
            expect(mail.from).to eq(['thezcenterhouston@gmail.com'])
        end

        it 'assigns @time' do
            expect(mail.body.encoded).to match(appt.time)
        end
    end

end