class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_garage_owner_super_admin?
    
    def index
        @notifications = Notification.where(recipient_id: current_user.id).unread
    end

    def mark_as_read
        @notifications = Notification.where(recipient_id: current_user.id).unread
        @notifications.update_all(read_at: Time.zone.now)
        render json: {success: true}
    end
end