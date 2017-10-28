class API::V1::DashboardsController < ApplicationController
   
  def index
    render status: :bad_request
  end

  def show
    @bookings = Booking.joins(garage_spot: :spot).joins(garage_spot: :garage).where("garage_spots.garage_id = ?", params[:id]).pluck("spots.id, spots.name, start_time, end_time, user_id")
    render json: @bookings, status: :ok
  end
end