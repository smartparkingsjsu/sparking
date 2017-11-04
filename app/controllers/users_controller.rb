class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :get_qr_code, :get_charges
  
  def index
    if super_admin?
      @users = User.all
    else
      flash[:notice] = 'Unauthorize user!'
      redirect_to root_path
    end
  end

  def edit
    @user.licenseplates.build
  end

  def update
    if user_params.nil?
      redirect_back(fallback_location: :back, notice: 'Profile was successfully updated.')
    else
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def get_qr_code(hash_id)
    require 'rqrcode'

    return RQRCode::QRCode.new(hash_id, :size => 1, :level => :h )
  end

  def show
    unless super_admin?    
      if @user.id != current_user.id.to_i
        redirect_to user_path(current_user.id)
      end
    end
    
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

    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :admin, :garage_id, licenseplates_attributes: Licenseplate.attribute_names.map(&:to_sym).push(:_destroy)) if params[:user]
    end

end
