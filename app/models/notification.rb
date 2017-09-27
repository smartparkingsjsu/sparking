class Notification < ApplicationRecord
    belongs_to :recipient, class_name: "User"
    belongs_to :booking

    scope :unread, -> {where(read_at: nil)}
end
