class SMS
	def self.send(to: nil, message: '')
		to ||= ENV['Default_SMS_Number']
		twilioClient = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
  	twilioClient.messages.create from: ENV['twilio_phone_number'], to: to, body: message
	end
end