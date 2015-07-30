class BookingMailer < ActionMailer::Base
	default from: "x14113791@student.ncirl.ie"

	def booking_confirmation booking
		@booking = booking
		mail to: booking.user.email, subject: "Your booking (##{booking.id})"
	end
end