class Bike < ActiveRecord::Base
	has_many :rent_requests
end
