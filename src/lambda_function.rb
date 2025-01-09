load_paths = Dir["./vendor/bundle/ruby/3.2.0/gems/**/lib"]
$LOAD_PATH.unshift(*load_paths)

# require_relative '../environment'
require_relative 'twilio_service'
require_relative 'aws_s3_service'
require 'cgi'
require 'aws-sdk-s3'
require 'httparty'

AWS = AwsS3Service.new
TWILIO = TwilioService.new

def lambda_handler(event:, context:)
  puts event
  request_body = CGI.parse(event["body"])
  media_url = request_body["MediaUrl0"].first
  message_id = request_body["MessageSid"].first
  filename = "/tmp/receipt_#{media_url}.jpg"
  
  user_id = TWILIO.fetch_user_phone(message_id)

  response = HTTParty.get(media_url, basic_auth: { username: ENV["TWILIO_ACCOUNT_SID"], password: ENV["TWILIO_AUTH_TOKEN"] })
  
  File.open(filename, 'wb') do |file|
    file.write(response.body)
  end
  
  ## TODO
  # user_id should be the user's id within the app, not their phone number.
  AWS.upload_receipt!(filename: filename, object_key: "#{user_id}/twilioUploadTest", message_id: message_id)
  
  HTTParty.delete(media_url, basic_auth: { username: ENV["TWILIO_ACCOUNT_SID"], password: ENV["TWILIO_AUTH_TOKEN"] })
end  

