class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user
  helper_method :get_qr_code, :get_charges
  
  def index
    if super_admin?
      @user = User.all
    else
      flash[:notice] = 'Unauthorize user!'
      redirect_to root_path
    end
  end

  def get_qr_code(hash_id)
    require 'rqrcode'

    return RQRCode::QRCode.new(hash_id, :size => 8, :level => :h )
  end

  def show
    if @user.id != current_user.id.to_i
      redirect_to user_path(current_user.id)
    end

    @licenseplates = Licenseplate.where(user_id: current_user.id)

    get_user_booking
  end

  def get_charges(booking_id)
    return Charge.where(booking_id: booking_id).first
  end

  def get_user_booking
    @hashids = Hashids.new("$p@rk!ng", 4)
    @bookings = Booking.where(user_id: @user.id)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
