class RentRequestsController < ApplicationController
  before_action :set_rent_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bike = Bike.find(params[:bike_id])
    @rent_requests = @bike.rent_requests
  end

  def show
    @bike = Bike.find(params[:bike_id])
    @rent_request = @bike.rent_requests.find(params[:id])
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @rent_request = @bike.rent_requests.build
  end

  def edit
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @rent_request = @bike.rent_requests.build(rent_request_params)
    if @rent_request.save
      redirect_to bike_rent_request_url(@bike, @rent_request)
    else
      render :action => "new"
    end
  end
   

  def update
    @rent_request.update(rent_request_params)
    respond_with(@rent_request)
  end

  def destroy
    @rent_request.destroy
    respond_with(@rent_request)
  end

  private
    def set_rent_request
      @rent_request = RentRequest.find(params[:id])
    end

    def rent_request_params
      params.require(:rent_request).permit(:name, :email, :rent_type, :rent_duration, :bike_id)
    end
end
