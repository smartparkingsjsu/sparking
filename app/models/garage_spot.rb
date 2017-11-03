class GarageSpot < ApplicationRecord
  validates :garage_id, presence: true
  validates :spot_id, presence: true
  validates_uniqueness_of :spot_id, :scope => [:garage_id]
  belongs_to :garage
  belongs_to :spot
  has_many :bookings, :dependent => :destroy
end
