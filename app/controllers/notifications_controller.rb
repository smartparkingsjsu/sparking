class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_garage_owner_super_admin?
    
    def index
        @notifications = Notification.where(recipient_id: current_user.id)
    end

end