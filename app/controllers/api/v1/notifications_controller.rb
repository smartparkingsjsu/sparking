class API::V1::NotificationsController < ApplicationController
  protect_from_forgery :except => :create

  def index
    @notifications = Notification.joins(booking: {garage_spot: :garage}).joins(booking: {garage_spot: :spot}).pluck("notifications.id, booking_id, read_at, notifications.created_at, action, confidence, garages.name, spots.name")
    render json: @notifications, status: :ok
  end

  def show
    @notifications = Notification.joins(booking: {garage_spot: :garage}).joins(booking: {garage_spot: :spot}).where("garages.id = ?", params[:id]).pluck("notifications.id, booking_id, read_at, notifications.created_at, action, confidence, garages.name, spots.name")
            
    render json: @notifications, status: :ok
  end

  def create
    @notifications = Notification.find(params[:notification_id])
    @notifications.read_at = Time.now

    if @notifications.save
      render status: :ok, json: {
          message: "Successfully updated request.",
        }.to_json
    else
      render status: :bad_request, json: {
          message: "Not found.",
        }.to_json
    end
  end

end