class Garage < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :spots, :through => :garage_spots
    has_many :garage_spots, :dependent => :destroy
end
