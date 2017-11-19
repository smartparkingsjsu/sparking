class PagesController < ApplicationController
respond_to :html, :xml, :json

  def load_google_map
    @list_all_garages = Garage.pluck(:id, :address, :name)
    @coordinates = []

    @list_all_garages.each do |a|
      if a.nil?
        @coordinates << [a[0], Geocoder.coordinates(a[1])[0], Geocoder.coordinates(a[1])[1], a[2], a[1]]
      end
    end

    if @coordinates.length > 0
      @all_garages = Gmaps4rails.build_markers(@coordinates) do |plot, marker|
        marker.lat plot.at(1)
        marker.lng plot.at(2)

        icon = "/images/google_maps_icon.png"

        marker.picture({
          "url" => icon,
          "width" => 30,
          "height" => 40
        })

        marker.infowindow render_to_string(:partial => "/pages/info",
                                           :locals => {:name => plot.at(3), :address => plot.at(4), :id => plot.at(0) })
      end
    end
  end

  def dashboard
    if !garage_owner? && !super_admin?
      redirect_to root_path
      flash[:notice] = 'Unauthorize user!'
    else
      @booking_time = get_booking_times
      @garage_spots = GarageSpot.where(garage_id: params[:garage_id])
      @spots_name = []
      @garage_spots.each do |spots|
        @spots_name << spots.spot.name
      end
      gon.garage_id = params[:garage_id]
      gon.booking_time = @booking_time
    end
  end

  def show
    load_google_map

    @booking_time = get_booking_times
    @parking_garages = Garage.all
    gon.user_license = 0
    gon.user_id = 0
    if current_user.present?
      gon.user_id = current_user.id
      @user = User.find(current_user.id)
      if @user.licenseplates
        gon.user_license = @user.licenseplates.first
      end
    end
    gon.user_signed = current_user.present?

    render template: "pages/#{params[:page]}"
  end

  private

end