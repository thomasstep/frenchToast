class Car < ApplicationRecord
   validates :VIN, presence:true, length: {minimum: 17, maximum: 17}
end
