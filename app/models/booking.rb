class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :booking_items

  def total_price
  	booking_items.inject(0) { |sum, item| sum + item.total_price }
  end
end
