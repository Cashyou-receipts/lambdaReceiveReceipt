require 'httparty'
require 'cgi'

MEDIA_URLS = [
]

MEDIA_URLS.each do |url|
  response = HTTParty.delete(CGI.parse(url).first.first, basic_auth: { username: ENV["TWILIO_ACCOUNT_SID"], password: ENV["TWILIO_AUTH_TOKEN"] })
  puts response
end