class API::V1::GarageSpotsController < ApplicationController
    
  def index
    @garage_spots = GarageSpot.all
    render json: @garage_spots
  end

  def show
    @garage_spots = GarageSpot.find(params[:id])
    render json: @garage_spots
  end
end