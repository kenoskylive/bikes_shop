require 'my_logger'
require 'bike_decorator'
class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bikes = Bike.all
    respond_with(@bikes)
  end

  def show
    respond_with(@bike)
  end

  def new
    @bike = Bike.new
    respond_with(@bike)
  end

  def edit
  end

  def create
    @bike_hire = Bike.new()
    
    @bike.name = params[:bike][:name]
    @bike.manufacturer = params[:bike][:manufacturer]
    #@bike.description = params[:bike][:description]
   
    # create an instance of a BasicBike
    myBike = BasicBike.new(20, @bike.manufacturer,@bike.name, @bike.image) 
    
    #add the extra features to the new bike
    if params[:bike][:Safety_Tools].to_s.length > 0 then
      myBike = SafetyToolsDecorator.new(myBike)
    end
    
    if params[:bike][:Extra_Tube].to_s.length > 0 then
      myBike = ExtraTubeDecorator.new(myBike)
    end
    
    if params[:bike][:cycling_gloves].to_s.length > 0 then
      myBike = CyclingGlovesDecorator.new(myBike)
    end
    
    if params[:bike][:Daily_Hire].to_s.length > 0 then
      myBike = DailyHireDecorator.new(myBike)
    end
    
    if params[:bike][:Weekly_Hire].to_s.length > 0 then
      myBike = WeeklyHireDecorator.new(myBike)
    end
    
    ## populate the price and the description details
    @bike.price = myBike.price
    @bike.description = myBike.details
    ##retrieves the instance/object of the MyLogger class
    logger = MyLogger.instance
    logger.logInformation("A new bike requseted: " + @bike.description)
        respond_to do |format|
    if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render :show, status: :created, location: @bike }
    else
    format.html { render :new }
    format.json { render json: @bike.errors, status: :unprocessable_entity }
    end
   end
  end
    

  # PATCH/PUT /bike_hires/1
  # PATCH/PUT /bike_hires/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Bike rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bike.destroy
    respond_with(@bike)
  end

  private
    def set_bike
      @bike = Bike.find(params[:id])
    end

    def bike_params
      params.require(:bike).permit(:bike_name, :price_per_day, :price_per_week, :descrition)
    end
end
