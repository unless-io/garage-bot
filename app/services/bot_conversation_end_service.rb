class BotConversationEndService
  def initialize(attributes)
    @message = attributes[:message]
    @current_bot_user = attributes[:user]
  end

  def call
    goodbye_message
  end

  private

  def goodbye_message
    @message.reply(text: "Dat waren alle vragen voor vandaag, fijne dag #{@current_bot_user.first_name}!")
  end
end