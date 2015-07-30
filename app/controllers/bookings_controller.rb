class BookingsController < ApplicationController
    before_filter :initialize_cart

    def create
        @booking_form = BookingForm.new(
            user: User.new(booking_params[:user]),
            cart: @cart
        )

        if @booking_form.save
            notify_user
            redirect_to root_path, notice: "Thank you for placing the rental"
        else
            render "carts/checkout"
        end
    end

    private

    def notify_user
        @booking_form.user.send_reset_password_instructions
        BookingMailer.booking_confirmation(@booking_form.booking).deliver
    end

    def booking_params
        params.require(:booking_form).permit(
            user: [ :name, :email, :phone, :address, :city, :country, :postal_code ]
            )
    end
end
 