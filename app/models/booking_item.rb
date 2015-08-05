class BookingItem < ActiveRecord::Base
  belongs_to :booking
  belongs_to :rental

  def total_price
  	self.quantity * self.rental.price
  end

  def total_price_per_day
    (price  + extraperson + ((rate + extraperson) * tax/100).to_i ) 
  end
end
