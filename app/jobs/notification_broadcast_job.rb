class NotificationBroadcastJob < ApplicationJob
  queue_as :default  
  
  def perform(notification)  
    ActionCable.server.broadcast 'notification_channel', action: render(notification)  
  end  

  private   
    def render(notification)  
        ApplicationController.renderer.render(partial: 'notifications/notification', locals: {notification: notification})  
    end  
end
