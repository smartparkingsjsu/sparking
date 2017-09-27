json.array! @notifications do |a|
    json.id a.id
    json.action a.action

    json.message do
        json.license_plate "with booking ID #{a.booking_id} "
    end
    #json.recipient a.recipient.name
    json.garage do
        json.located_at "located in #{a.booking.garage_spot.garage.name}, spot #{a.booking.garage_spot.spot.name}"
    end

    json.url notification_path(a.id)
end