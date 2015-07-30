class CartsController < ApplicationController
	before_filter :initialize_cart

	def add
		@cart.add_item params[:id]
		session["cart"] = @cart.serialize
		rental = Rental.find params[:id]
		redirect_to :back, notice: "Added #{rental}to cart."
	end

	def show
	end

	def checkout
		@booking_form = BookingForm.new user: User.new
	end

end