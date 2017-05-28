class BotConversationStartService
  def initialize(attributes)
    @message = attributes[:message]
    @current_bot_user = attributes[:user]
    @questionaire = attributes[:questionaire]
  end

  def call
    hello_message
  end

  private

  def hello_message
    @message.reply(text: "Hi #{@current_bot_user.first_name}! These are your questions for today, they come from the #{@questionaire.title} questionaire!")
  end
end