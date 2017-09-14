class GarageSpot < ApplicationRecord
  validates_uniqueness_of :spot_id, :scope => [:garage_id]
  belongs_to :garage
  belongs_to :spot
  has_many :bookings, :dependent => :destroy
end
