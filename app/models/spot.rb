class Spot < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :garages, :through => :garage_spots
    has_many :garage_spots, :dependent => :destroy
end
