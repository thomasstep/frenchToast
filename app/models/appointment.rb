class Appointment < ApplicationRecord
	validates :owner_email, presence:true
	validates :VIN, presence:true
	validates :date, presence:true
	validates :time, presence:true
	validates :reason, presence: true, format: { with: /\A[a-zA-Z0-9'"@.,]{1,300}/, message: "must have only valid characters including puncutation"}
end


