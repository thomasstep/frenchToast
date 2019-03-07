class Appointment < ApplicationRecord
	validates :owner_email, presence:true
	validates :VIN, presence:true
	validates :date, presence:true
	validates :time, presence:true
	validates :reason, presence:true
end
