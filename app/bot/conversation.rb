include Facebook::Messenger
include GarageBotHelper


begin  
  Bot.on :message do |message|
    if bot_user_exists?(message.sender["id"])
      BotConversationService.new(message: message).call
    else
      BotFirstVisitService.new(message: message).call
    end 
  end  
rescue Exception => e  
  puts e.message  
  puts e.backtrace.inspect  
end  
