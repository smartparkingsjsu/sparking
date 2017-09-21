class PagesController < ApplicationController
respond_to :html, :xml, :json

  def load_google_map
    @list_all_garages = Garage.pluck(:id, :address, :name)
    @coordinates = []

    @list_all_garages.each do |a|
      @coordinates << [a.at(0), Geocoder.coordinates(a.at(1)).at(0), Geocoder.coordinates(a.at(1)).at(1), a.at(2), a.at(1)]
    end

    @all_garages = Gmaps4rails.build_markers(@coordinates) do |plot, marker|  
      marker.lat plot.at(1)
      marker.lng plot.at(2)

      url_alert = "/images/parking.png"  

      marker.picture({  
        "url" => url_alert,  
        "width" => 30,  
        "height" => 30  
      })  

      marker.infowindow render_to_string(:partial => "/pages/info",   
      :locals => {:name => plot.at(3), :address => plot.at(4), :id => plot.at(0) })  
    end
  end

  def show
    load_google_map

    render template: "pages/#{params[:page]}"
  end

  def next
    get_spot_now
  end

  def get_spot_now
    find_garage
    get_length
    find_garage_spot
    charge

    @time_now = Time.now.in_time_zone.change(:sec => 0) + 1.minutes
    @last_in_list = @garage_spot.last

    @garage_spot.each do |a|
      @booking =  Booking.new(start_time: @time_now, length: @length, user_id: current_user.id, garage_spot_id: a.id)

      if @booking.save
        flash[:notice] = 'Booking added!'
        redirect_to root_path
        break
      end

      if @last_in_list == a
        #charge = Stripe::Charge.retrieve("ch_123")
        #charge.refund
        flash[:notice] = 'Booking failed!'
        redirect_to root_path
      end
    end
  end

  def charge
    @amount = 500
  
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
      redirect_to new_charge_path #this need to be changed
  end

  private
  def find_garage_spot
    @garage_spot = GarageSpot.all.where("garage_id = ?", @garageid)
  end

  def find_garage
    @garageid = params[:garageid]
  end

  def get_length
    @length = params[:length]
  end

  def get_booking
    @bookings = Booking.joins(:garage_spot).where("garage_spot_id = ? AND end_time >= ?", @garage_spot.id, Time.now)
  end

end