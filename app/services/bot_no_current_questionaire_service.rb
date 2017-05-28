class BotNoCurrentQuestionaireService
  def initialize(attributes)
    @message = attributes[:message]
    @current_bot_user = attributes[:current_bot_user]
  end

  def call
    no_current_questionaire
  end

  private

  def no_current_questionaire
    @message.reply(text: "Hi #{@current_bot_user.first_name}. I don't have any questions for you at the moment, sorry!")
  end
end