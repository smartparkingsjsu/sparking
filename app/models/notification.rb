class Notification < ApplicationRecord
    belongs_to :recipient, class_name: "User"
    belongs_to :booking

    after_create_commit { NotificationBroadcastJob.perform_later self }  
    after_update_commit { NotificationBroadcastJob.perform_later self }
end
