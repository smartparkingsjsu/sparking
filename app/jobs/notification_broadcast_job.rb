class NotificationBroadcastJob < ApplicationJob
  queue_as :default  
  
  def perform(notification)  
    ActionCable.server.broadcast "notification_#{notification.recipient_id}_channel", notification: "#{notification.read_at}"
  end  
end
