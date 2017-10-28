class API::V1::NotificationsController < ApplicationController
   
    def index
        @notifications = Notification.joins(booking: {garage_spot: :garage}).joins(booking: {garage_spot: :spot}).pluck("notifications.id, booking_id, read_at, notifications.created_at, action, confidence, garages.name, spots.name")
        render json: @notifications, status: :ok
    end

    def show
        @notifications = Notification.joins(booking: {garage_spot: :garage}).joins(booking: {garage_spot: :spot}).where("garages.id = ?", params[:id]).pluck("notifications.id, booking_id, read_at, notifications.created_at, action, confidence, garages.name, spots.name")
                
        if @notifications.empty?
            render json: @notifications, status: :bad_request
        else
            render json: @notifications, status: :ok
        end
    end
end