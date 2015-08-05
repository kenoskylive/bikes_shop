# the concrete component we would like to decorate, a bike in our example
class BasicBike
	def initialize(price, manufacturer, description)
		@price = price
		@manufacturer = manufacturer
		@description = "basic bike"
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
class BikeDecorator
	def initialize(real_bike) 
		@real_bike = real_bike
		@extra_price = 0
		@description = "no extra feature"
	end
	
	def price
		return @extra_price + @real_bike.price
	end
	
	def details
		return @description + " " + @real_bike.details
	end
	
end


# a concrete decorator of our bike_hire
class SafetyToolsDecorator < BikeDecorator
	def initialize(real_bike)
		super(real_bike)
		@description = "Safety tools"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_bike.details  
	end	
end

#***/## another concrete decorator
class ExtraTubeDecorator < BikeDecorator
	def initialize(real_bike)
		super(real_bike) 
		@description = "extra tube"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_bike.details  
	end	
end

# another concrete decorator
class CyclingGlovesDecorator < BikeDecorator
	def initialize(real_bike)
		super(real_bike)
		@description = "Cyling Gloves"
		@extra_price = 8
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_bike.details  
	end	
end
# another concrete decorator
class DailyHireDecorator < BikeDecorator
	def initialize(real_bike)
		super(real_bike_hire)
		@description = "Daily Hire"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_bike.details  
	end	
end

# another concrete decorator
class WeeklyHireDecorator < BikeDecorator
	def initialize(real_bike)
		super(real_bike)
		@description = "Weekly Hire"
		@extra_price = 5
	end
	
	def details
		return @description + ": #{@extra_price} + " + @real_bike.details  
	end	
end
