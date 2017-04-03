# app/bot/example.rb

include Facebook::Messenger
include GarageBotHelper

Bot.on :message do |message|
  if bot_user_exists?(message.sender["id"])
    BotConversationService.new(message: message).call
  else
    BotFirstVisitService.new(message: message).call
  end 
end
