class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :authenticate_user!
  before_action :find_garage_spot
  before_action :find_garage

  def index
    get_booking

    respond_with @bookings
  end

  def new
    get_booking

    @booking = Booking.new(garage_spot_id: @garage_spot.id)
  end

  def create
    get_booking

    @booking =  Booking.new(params[:booking].permit(:garage_spot_id, :start_time, :length).merge(user_id: current_user.id, garage_spot_id: @garage_spot.id))

    if @booking.save
      redirect_to garage_garage_spot_bookings_path(@garage, @garage_spot, method: :get)
    else
      render 'new'
    end
  end

  def show
    get_user_booking

    if current_user.admin?
      @booking = Booking.find(params[:id])
    else
      @booking = Booking.where("user_id = ?", current_user.id).find(params[:id])
    end
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to garage_garage_spot_bookings_path(@garage, @garage_spot)
    else
      render 'index'
    end
  end

  def edit
    get_booking

    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.garage_spot = @garage_spot

    if @booking.update(params[:booking].permit(:garage_spot_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to garage_garage_spot_bookings_path(@garage, @garage_spot)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to garage_spot_booking_path(@garage_spot, @booking)
      else
        render 'new'
      end
  end

  def find_garage_spot
    if params[:garage_spot_id]
      @garage_spot = GarageSpot.find_by_id(params[:garage_spot_id])
    end
  end

  def find_garage
    if params[:garage_id]
      @garage = Garage.find_by_id(params[:garage_id])
    end
  end

  def get_booking
    @bookings = Booking.joins(:garage_spot).where("garage_spot_id = ? AND end_time >= ?", @garage_spot.id, Time.now)
  end

  def get_user_booking
    @bookings = Booking.joins(:garage_spot).where("garage_spot_id = ? AND end_time >= ? AND user_id = ?", @garage_spot.id, Time.now, current_user.id)
  end
end
