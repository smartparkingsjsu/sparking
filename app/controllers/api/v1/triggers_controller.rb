class API::V1::TriggersController < ApplicationController
  protect_from_forgery :except => :create

  def from_post_request
    @license = params[:license_plate]
    @camera = params[:serial]
    @confidence = params[:confidence]
    @time = params[:time] #.in_time_zone.to_s(:db) #@time = Time.now

    logger.debug("")
    logger.debug("################# TIME START ##################")
    logger.debug("")
    logger.debug("Raw time: #{params[:time].inspect}")
    logger.debug("Converted time: #{@time.inspect}")
    logger.debug("################# TIME END ##################")
  end

  def create
    from_post_request

    @get_garage_spot = GarageSpot.where(serial: @camera).first
    @get_garage_id = @get_garage_spot.garage_id
    @get_booking = Booking.where("garage_spot_id = ? AND start_time <= ? AND end_time >= ?", @get_garage_spot.id, @time, @time).first
    
    unless @get_booking.present?
      Notification.create(recipient_id: @get_garage_id, confidence: @confidence, action: "license plate mismatch at "+@get_garage_spot.spot.name) 

      if @get_garage_spot.garage.notify == true
        NotifyMailer.notify_owner(@get_booking).deliver_later
      end
    else
      if @get_booking.user.admin.nil?        
        @get_user_id = @get_booking.user.id
        @get_license_plates = Licenseplate.where(user_id: @get_user_id).pluck(:license_plate)

        unless @get_license_plates.include? @license
          Notification.create(recipient_id: @get_garage_id, booking_id: @get_booking.id, confidence: @confidence, action: "license plate mismatch") 

          if @get_booking.garage_spot.garage.notify == true
            NotifyMailer.notify_owner(@get_booking).deliver_later
          end
        end
      end
    end

    debug_section

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