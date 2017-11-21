class DebugsController < ApplicationController
  before_action :check_super_admin?
  
  def index
    @users = User.all
    @bookings = Booking.all
    @garages = Garage.all
    @spots = Spot.all
    @charges = Charge.all
    @garage_spots = GarageSpot.all
    @licenseplates = Licenseplate.all
    #@notifications = Notification.all
  end

end
