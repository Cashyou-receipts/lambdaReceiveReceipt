require 'twilio-ruby'

class TwilioService
  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV["TWILIO_PHONE_NUMBER"]
  end

  def fetch_user_phone(message_sid)
    @client.messages(message_sid).fetch.from
  end
end