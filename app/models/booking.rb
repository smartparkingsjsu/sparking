require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  
  belongs_to :user
  belongs_to :garage_spot
  has_one :charge, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
end