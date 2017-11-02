class GarageSpot < ApplicationRecord
  validates_uniqueness_of :spot_id, :scope => [:garage_id], unless: Proc.new { |f| f.garage.zone == true }
  belongs_to :garage
  belongs_to :spot
  has_many :bookings, :dependent => :destroy
end
