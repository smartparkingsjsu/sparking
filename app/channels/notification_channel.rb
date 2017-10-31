class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_#{params['garage_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end