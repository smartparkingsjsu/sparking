class Notification < ApplicationRecord
    belongs_to :recipient, class_name: "Garage"
    belongs_to :booking
    validates :recipient_id, presence: true
    validates :confidence, presence: true
    validates :booking_id, presence: true
    validates :action, presence: true

    after_create_commit { NotificationBroadcastJob.perform_later self }  
    after_update_commit { NotificationBroadcastJob.perform_later self }
end