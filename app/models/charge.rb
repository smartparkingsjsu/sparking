class Charge < ApplicationRecord
  belongs_to :booking
  has_many :bookings
end
