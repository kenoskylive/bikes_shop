class BookingItem < ActiveRecord::Base
  belongs_to :booking
  belongs_to :rental

  def total_price
  	self.quantity * self.rental.price
  end
end
