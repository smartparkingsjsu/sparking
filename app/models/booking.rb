require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  
  belongs_to :user
  belongs_to :garage_spot
  has_many :charges, :dependent => :destroy
  has_one :charge
  has_many :notifications, :dependent => :destroy
end