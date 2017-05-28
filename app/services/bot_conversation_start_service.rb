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
    @message.reply(text: "Hoi #{@current_bot_user.first_name}! Hier komen jouw vragen voor vandaag, ze komen van de '#{@questionaire.title}' vragenlijst!")
  end
end