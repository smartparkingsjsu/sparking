class Garage < ApplicationRecord
    has_many :spots, :through => :garage_spots
    has_many :garage_spots, :dependent => :destroy
    has_one :price, :dependent => :destroy
end
