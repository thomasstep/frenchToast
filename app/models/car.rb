class Car < ApplicationRecord
   validates :VIN, presence:true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]{17}\z/, message: "VIN must be 17 alphanumeric only characters" }
   validates :year, presence: true, format: { with: /\A(20[0-2][0-9])|(19[0-9][0-9])/, message: "1900-Current Year"}
	 validates :model, presence: true, format: { with: /\A[a-zA-Z0-9-]{1,15}\z/, message: "must be between 1 and 15 characters" }
	 validates :make, presence: true, format: { with: /\A[a-zA-Z]{1,15}\z/, message: "must be between 1 and 15 characters" }
end
