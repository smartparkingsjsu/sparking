require 'net/http'
require 'uri'

url = 'http://smartparkingsjsu-api.herokuapp.com/api/v1/notifications'
uri = URI.parse(url)

params = {notification_id: "2"}

Net::HTTP.post_form(uri, params)