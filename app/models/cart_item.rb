class CartItem 
	attr_reader :rental_id, :quantity

	def initialize rental_id, quantity = 1
		@rental_id = rental_id
		@quantity = quantity
	end

	def increment
		@quantity = @quantity + 1
	end

	def rental
		Rental.find rental_id
	end

	def total_price
		rental.price * quantity
	end
end