require 'my_logger'
require 'rental_decorator'
class RentalsController < ApplicationController
  #before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_filter :initialize_cart
  before_filter :authenticate_user!
  before_filter :ensure_admin, :only => [:edit, :destroy]

  respond_to :html

  def index
    @rentals = Rental.all
    respond_with(@rentals)
  end

  def show
    respond_with(@rentals)
  end

  def new
    @rental = Rental.new
    respond_with(@rental)
  end

  def edit
  end

  def create
    @rental = Rental.new()
    
    @rental.name = params[:rental][:name]
    @rental.manufacturer = params[:rental][:manufacturer]
    #@rental.description = params[:rental][:description]
   
    # create an instance of a BasicBike
    myRental = BasicRental.new(20, @rental.manufacturer,@rental.name, @rental.image) 
    
    #add the extra features to the new rental
    if params[:rental][:Safety_Tools].to_s.length > 0 then
     myRental = SafetyToolsDecorator.new(myRental)
    end
    
    if params[:rental][:Extra_Tube].to_s.length > 0 then
      myRental = ExtraTubeDecorator.new(myRental)
    end
    
    if params[:rental][:cycling_gloves].to_s.length > 0 then
      myRental = CyclingGlovesDecorator.new(myRental)
    end
    
    if params[:rental][:Daily_Hire].to_s.length > 0 then
      myRental = DailyHireDecorator.new(myRental)
    end
    
    if params[:rental][:Weekly_Hire].to_s.length > 0 then
      myRental = WeeklyHireDecorator.new(myRental)
    end

    ## populate the price and the description details
    @rental.price = myRental.price
    @rental.description = myRental.details
    # retrieve the instance/object of the MyLogger class
    logger = MyLogger.instance
    logger.logInformation("A new rental requested: " + @rental.description)
        respond_to do |format|
    if @bike.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
   else
    format.html { render :new }
    format.json { render json: @rental.errors, status: :unprocessable_entity }
    end
   end
  end


  def update
     respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Bike rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @rental.destroy
    respond_with(@rental)
  end

  def ensure_admin
    unless current_user && current_user.admin?
      render :text => "Access Error Message", :status => :unauthorized
    end
  end


  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:name, :manufacturer, :price, :image, :description)
    end
end
