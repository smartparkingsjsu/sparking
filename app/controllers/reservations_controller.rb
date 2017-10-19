class ReservationsController < ApplicationController
respond_to :html, :xml, :json

  def garage_reservation
    get_spot_now
  end

  def online_reservation
    get_spot_online
  end

  # In-garage booking method
  def get_spot_now
    find_garage
    get_length
    find_garage_spot
    user_booking_view

    @time = Time.now.in_time_zone.change(:sec => 0) + 1.minutes
    @last_in_list = @garage_spot.last
    @amount = rand(100..1000)

    booking_logic
  end

  # Online booking method
  def get_spot_online
    find_garage
    get_start_time
    get_length_online
    find_garage_spot
    user_booking_view

    @last_in_list = @garage_spot.last
    @amount = rand(100..1000)

    booking_logic
  end

  def booking_logic
    if @garage_spot.empty?
      flash[:notice] = 'Not spot is assigned to garage!'
      redirect_to root_path
    else
      @garage_spot.each do |a|
        @booking =  Booking.new(start_time: @time, length: @length, user_id: current_user.id, garage_spot_id: a.id)

        logger.debug "Start Time: #{@booking.inspect}"

        if @booking.save
          if @user_booking_view.present?
            charge
            @charges = Charge.new(booking_id: @booking.id, amount: @amount, token: @token, paid: "t")
      
            if @charges.save
              flash[:notice] = 'Booking added & Card is charged!'
            else
              flash[:notice] = 'Booking is added but not stored in history!'
            end

            get_unique_booking_id
            get_qr_code

            break
          else  
            @charges = Charge.new(booking_id: @booking.id, amount: @amount, paid: "f")
            
            if @charges.save
              flash[:notice] = 'Booking added!'
            else
              flash[:notice] = 'Booking is added but not stored in history!'
            end
            
            get_unique_booking_id
            get_qr_code

            break
          end

        end

        if @last_in_list == a
          flash[:notice] = 'No spot available. Your card is not charged'
          redirect_to root_path
          break
        end
        
      end
    end
  end

  def get_qr_code
    require 'rqrcode'

    @qr = RQRCode::QRCode.new(@hash_booking_id, :size => 6, :level => :h )
  end

  def get_unique_booking_id
    hashids = Hashids.new("$p@rk!ng", 4)
    @hash_booking_id = hashids.encode(@booking.id)
  end

  def reterive_booking_id
    hashids = Hashids.new("$p@rk!ng", 4)
    @booking_id = hashids.decode(@hash_booking_id)
  end

  def charge
    @token = params[:stripeToken]
  
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path #should not go into this
  end

  private
    def find_garage_spot
      @garage_spot = GarageSpot.all.where("garage_id = ?", @garageid)
    end

    def get_start_time
      @date = Time.parse(params[:date]).in_time_zone
      @time = @date+(params[:time]).to_i.hours
    end

    def get_length_online
      @end_time = params[:end_time]
      @length = @end_time.to_i - params[:time].to_i
    end

    def find_garage
      @garageid = params[:garageid]
    end

    def user_booking_view
      @user_booking_view = params[:user_booking_view]
    end

    def get_length
      @length = params[:length]
    end

    def get_booking
      @bookings = Booking.joins(:garage_spot).where("garage_spot_id = ? AND end_time >= ?", @garage_spot.id, Time.now)
    end

end