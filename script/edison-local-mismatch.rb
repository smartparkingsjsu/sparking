require 'net/http'
require 'uri'

url = 'http://localhost:3000/api/v1/triggers'
uri = URI.parse(url)

params = {serial: "FZEDA544D00YLV501", time: "2018-02-23 19:45:00", license_plate: "ALBERTO"}

Net::HTTP.post_form(uri, params)