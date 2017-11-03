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
    
    @count = 0
    @get_garage_spot = GarageSpot.where(serial: @camera)
    @get_zone = true if @get_garage_spot.count > 1
    @get_booking = Booking.where(garage_spot_id: @get_garage_spot.pluck(:id)).where("start_time <= ? AND end_time >= ?", @time, @time)

    @get_booking.each do |f|
      @get_each_user_license = Licenseplate.where(user_id: f.user_id).pluck(:license_plate)

      if @get_each_user_license.included_in?@license
        @license = @license - @get_each_user_license
      else
        if @get_zone
          @count = @count+1
        else
          Notification.create(recipient_id: f.garage_spot.garage_id, booking_id: f.id, confidence: @confidence, action: "license plate mismatch at spot "+f.garage_spot.spot.name) 

          if f.garage_spot.garage.notify == true
            NotifyMailer.notify_owner(f).deliver_later
          end
        end
      end
    end

    if @count >= 1
      Notification.create(recipient_id: @get_booking.last.garage_spot.garage_id, booking_id: @get_booking.last.garage_spot.spot_id, confidence: @confidence, action: @count.to_s+" license plate mismatch "+@license.to_s+" at zone "+@get_booking.last.garage_spot.spot.name) 
      NotifyMailer.notify_owner(@get_booking.last).deliver_later
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