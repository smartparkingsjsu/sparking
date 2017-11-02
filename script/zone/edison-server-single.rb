require 'net/http'
require 'uri'

url = 'http://smartparkingsjsu-api.herokuapp.com/api/v1/triggers'
uri = URI.parse(url)

array = ["6ABCD6"]

params = {serial: "FZEDA544D00YLV501", time: "2018-02-23 19:45:00", "license_plate[]" => array, confidence: "50.9"}

Net::HTTP.post_form(uri, params)