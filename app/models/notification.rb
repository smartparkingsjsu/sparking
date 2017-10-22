class Notification < ApplicationRecord
    belongs_to :recipient, class_name: "User"
    belongs_to :booking
    validates :recipient_id, presence: true
    validates :confidence, presence: true
    validates :booking_id, presence: true
    validates :action, presence: true

    scope :unread, -> {where(read_at: nil)}
end
