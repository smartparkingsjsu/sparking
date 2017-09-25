class API::V1::BookingsController < ApplicationController
    
    def index
        @booking = Booking.joins(:user).pluck(:id, :start_time, :end_time, :garage_spot_id)
        render json: @booking
    end

    def show
        @booking = Booking.find(params[:id])
        render json: @booking
    end
end