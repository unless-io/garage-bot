# app/bot/example.rb

include Facebook::Messenger

Bot.on :message do |message|
  # current_bot_user = User.find_by_uid(message.sender["id"])

  # message.reply(text: "Hello, #{current_bot_user.first_name}!")
  message.reply(text: "https://b01e6c99.ngrok.io/facebook_account_link?fb_messenger_id=#{message.sender["id"]}")
end