load_paths = Dir["./vendor/bundle/ruby/3.2.0/gems/**/lib"]
$LOAD_PATH.unshift(*load_paths)

require 'cgi'
require 'aws-sdk-s3'
require 'httparty'

CLIENT = Aws::S3::Client.new(
    access_key_id: ENV["S3_ACCESS_KEY"],
    secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
    force_path_style: true, 
    region: ENV["S3_BUCKET_REGION"]
  )

def lambda_handler(event:, context:)
  media_url = CGI.parse(event["body"])["MediaUrl0"].first
  filename = "/tmp/receipt_#{CGI.parse(event["body"])["MessageSid"].first}.jpg"
  
  response = HTTParty.get(media_url, basic_auth: { username: ENV["TWILIO_ACCOUNT_SID"], password: ENV["TWILIO_AUTH_TOKEN"] })
  
  File.open(filename, 'wb') do |file|
    file.write(response.body)
  end
  
  File.open(filename, "rb") do |file|
    CLIENT.put_object({
      body: file,
      bucket: ENV["S3_BUCKET_NAME"],
      key: "test/twilioUploadTest",
      metadata: {
        "updload_date"=>Date.today.to_s
      },
      content_type: "image/jpg"
    })
  end
  
  HTTParty.delete(media_url, basic_auth: { username: ENV["TWILIO_ACCOUNT_SID"], password: ENV["TWILIO_AUTH_TOKEN"] })
end  

