require 'net/http'
require 'uri'

url = 'http://somii.herokuapp.com/events'
uri = URI.parse(url)

params = {message: "Hello"}

Net::HTTP.post_form(uri, params)