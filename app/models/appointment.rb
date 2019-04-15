class Appointment < ApplicationRecord
	validates :owner_email, presence:true, format: {with: /\A([A-Za-z0-9!$%&'*+=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?$)\z/, message: "Please enter a valid email"}
	validates :VIN, presence:true, format: {with: /\A[a-zA-Z0-9]{17}\z/, message: "VIN must be 17 alphanumeric only characters"}
	validates :first_name, presence:true, format: { with: /\A[a-zA-Z]{1,15}\z/, message: "must be from 1 to 15 characters"}
	validates :last_name, presence:true, format: { with: /\A[a-zA-Z]{1,15}\z/, message: "must be from 1 to 15 characters"}
	
	validates :date, presence:true
	validates :time, presence:true
	validates :phone, presence:true, format: {with: /\A[(]?[?0-9]{3}[)]?[-. ]?[0-9]{3}[-. ]?[0-9]{4}/, message: "must be 10 digit numeric, (XXX)-XXX-XXX, XXXXXXXXXX, XXX-XXX-XXXX, XXX.XXX.XXXX"}
	validates :reason, presence: true, format: { with: /\A[a-zA-Z0-9'"@.,]{1,300}/, message: "must have only valid characters including puncutation"}
	validates :year, presence: true, format: { with: /\A(20[0-2][0-9])|(19[0-9][0-9])/, message: "1900-Current Year"}
	validates :model, presence: true, format: { with: /\A[a-zA-Z0-9-]{1,15}\z/, message: "must be between 1 and 15 characters" }
	validates :make, presence: true, format: { with: /\A[a-zA-Z]{1,15}\z/, message: "must be between 1 and 15 characters" }
end


