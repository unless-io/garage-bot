# app/bot/example.rb

include Facebook::Messenger

Bot.on :message do |message|
  GarageBotService.new(message: message).call
end


