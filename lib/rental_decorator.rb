class BasicRental
	def initialize(price, manufacturer, description)
		@price = price
		@manufacturer = manufacturer
		@description = "basic rental"
	end
	
	# getter method
	def price
		return @price
	end

	def image
		return @image
	end
	
	def details
		return @description + ": #{@price}; " + @manufacturer + "; " + @image 
	end	
end

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class RentalDecorator
	def initialize(real_rental) 
		@real_rental = real_rental
		@extra_price = 0
		@description = "no extra feature"
	end
	
	def price
		return @extra_price + @real_rental.price
	end
	
	def details
		return @description + " " + @real_rental.details
	end
	
end


# a concrete decorator of our bike_hire
class SafetyToolsDecorator < RentalDecorator
	def initialize(real_rental)
		super(real_rental)
		@description = "Safety tools"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_rental.details  
	end	
end

#***/## another concrete decorator
class ExtraTubeDecorator < RentalDecorator
	def initialize(real_rental)
		super(real_rental) 
		@description = "extra tube"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_rental.details  
	end	
end

# another concrete decorator
class CyclingGlovesDecorator < RentalDecorator
	def initialize(real_rental)
		super(real_rental)
		@description = "Cyling Gloves"
		@extra_price = 8
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_rental.details  
	end	
end
# another concrete decorator
class DailyHireDecorator < RentalDecorator
	def initialize(real_rental)
		super(real_rental)
		@description = "Daily Hire"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_rental.details  
	end	
end

# another concrete decorator
class WeeklyHireDecorator < RentalDecorator
	def initialize(real_rental)
		super(real_rental)
		@description = "Weekly Hire"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_rental.details  
	end	
end
