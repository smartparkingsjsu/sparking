require 'net/http'
require 'uri'

url = 'http://smartparkingsjsu-api.herokuapp.com/api/v1/triggers'
uri = URI.parse(url)

array = ["1ABCD1", "ALBERTX", "1ABCD2", "ALBERTO"]

params = {serial: "FZEDA544D00YLV501", time: "2018-02-23 19:45:00", license_plate: "ALBERTO", confidence: "50.9"}

Net::HTTP.post_form(uri, params)