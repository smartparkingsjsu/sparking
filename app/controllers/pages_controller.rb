class PagesController < ApplicationController
respond_to :html, :xml, :json

  def show
    render template: "pages/#{params[:page]}"
  end

  def next
    get_spot_now
  end

  def get_spot_now
    find_garage
    get_length
    find_garage_spot

    @time_now = "2018-02-26 18:45:00" #Time.now.strftime('%e %b %Y %H:%M%p')
    @last_in_list = @garage_spot.last

    @garage_spot.each do |a|
      @booking =  Booking.new(start_time: @time_now, length: @length, user_id: current_user.id, garage_spot_id: a.id)

      if @booking.save
        flash[:notice] = 'booking added'
        redirect_to root_path
        break
      end

      if @last_in_list == a
        flash[:notice] = 'booking failed'
        redirect_to root_path
      end
    end
  end

  private
  def find_garage_spot
    @garage_spot = GarageSpot.all.where("garage_id = ?", @garageid)
  end

  def find_garage
    # @get_garage = params[:garage]
    @garageid = params[:garageid]
  end

  def get_length
    @length = params[:length]
  end

  def get_booking
    @bookings = Booking.joins(:garage_spot).where("garage_spot_id = ? AND end_time >= ?", @garage_spot.id, Time.now)
  end

end
