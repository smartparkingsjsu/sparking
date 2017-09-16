class API::V1::GaragesController < ApplicationController
   
    def index
        @garage = Garage.all
        render json: @garage
    end

    def show
        @garage = Garage.find(params[:id])
        render json: @garage
    end
end