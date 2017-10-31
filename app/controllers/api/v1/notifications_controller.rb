class API::V1::NotificationsController < ApplicationController
  protect_from_forgery :except => :create

  def index
    @notifications = Notification.joins(booking: {garage_spot: :garage}).joins(booking: {garage_spot: :spot}).pluck("notifications.id, booking_id, read_at, notifications.created_at, action, confidence, garages.name, spots.name")

    # Form json
    notifications_array = []
    @notifications.each do |notification|
      temp_json = {
          "notification_id": notification[0],
          "booking_id": notification[1],
          "read_at": notification[2],
          "created_at": notification[3],
          "message": notification[4],
          "confidence": notification[5],
          "garage_name": notification[6],
          "spot_name": notification[7]
      }
      notifications_array.push(temp_json)
    end

    render json: {"notifications": notifications_array}, status: :ok
  end

  def show
    @notifications = Notification.joins(booking: {garage_spot: :garage}).joins(booking: {garage_spot: :spot}).where("recipient_id = ?", params[:id]).pluck("notifications.id, booking_id, read_at, notifications.created_at, action, confidence, garages.name, spots.name")

    # Form json
    notifications_array = []
    @notifications.each do |notification|
      temp_json = {
          "notification_id": notification[0],
          "booking_id": notification[1],
          "read_at": notification[2],
          "created_at": notification[3],
          "message": notification[4],
          "confidence": notification[5],
          "garage_name": notification[6],
          "spot_name": notification[7]
      }
      notifications_array.push(temp_json)
    end

    render json: {"notifications": notifications_array}, status: :ok
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