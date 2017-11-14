class API::V1::TriggersController < ApplicationController
  protect_from_forgery :except => :create

  def from_post_request
    @license = params[:license_plate]
    @camera = params[:serial]
    @confidence = params[:confidence]
    @time = params[:time].in_time_zone.to_s(:db) #@time = Time.now
  end

  def create
    from_post_request

    @get_garage_spot = GarageSpot.where(serial: @camera)

    @get_booking = Booking.where(garage_spot_id: @get_garage_spot.pluck(:id)).where("start_time <= ? AND end_time >= ?", @time, @time)

    @get_booking.each do |f|
      @get_each_user_license = Licenseplate.where(user_id: f.user_id).pluck(:license_plate)

      if @get_each_user_license.included_in?@license
        @license = @license - @get_each_user_license
      else
        Notification.create(recipient_id: f.garage_spot.garage_id, booking_id: f.id, confidence: @confidence, action: "License plate mismatch at spot "+f.garage_spot.spot.name)

        if f.garage_spot.garage.notify == true
          NotifyMailer.notify_owner(f).deliver_later
        end
      end
    end

    #debug_section

    render status: :OK, json: {
        message: "Successfully created notification",
      }.to_json
  end

  def debug_section
    logger.debug(" ")
    logger.debug("################# DEBUG START ##################")
    logger.debug("")
    
    if @get_license_plates.include? @license
        logger.debug("#{@license.inspect} is in the #{@get_license_plates.inspect}")
    else
        logger.debug("#{@license.inspect} is NOT the #{@get_license_plates.inspect}")
    end

    logger.debug("Time used to compare: #{@time.inspect}")
    logger.debug("GarageSpotID: #{@get_garage_spot.id}; GarageID: #{@get_garage_spot.garage_id}; SpotID: #{@get_garage_spot.spot_id}")
    logger.debug("BookingID: #{@get_booking.id}; StartTime: #{@get_booking.start_time}; EndTime: #{@get_booking.end_time}; GarageSpotID: #{@get_booking.garage_spot_id}; UserID: #{@get_booking.user_id}")
    logger.debug("UserID: #{@get_user_id.inspect}")
    
    logger.debug("")
    logger.debug("################## DEBUG END ###################")
    logger.debug(" ")
  end
 end