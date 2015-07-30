class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_filter :initialize_cart

  respond_to :html

  def index
    @rentals = Rental.all
    respond_with(@rentals)
  end

  def show
    respond_with(@rental)
  end

  def new
    @rental = Rental.new
    respond_with(@rental)
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.save
    respond_with(@rental)
  end

  def update
    @rental.update(rental_params)
    respond_with(@rental)
  end

  def destroy
    @rental.destroy
    respond_with(@rental)
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:name, :manufacturer, :price, :image, :description)
    end
end
