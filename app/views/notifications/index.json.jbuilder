json.array! @notifications do |a|
    json.id a.id
    json.action a.action

    json.message do
        json.license_plate "on #{a.event.booking.user.license_plate}"
    end
    #json.recipient a.recipient.name
    json.garage do
        json.located_at "located in #{a.event.booking.garage_spot.garage.name}, spot #{a.event.booking.garage_spot.spot.name}"
    end

    json.url event_path(a.event.id)
end