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
    @message.reply(text: "Hoi #{@current_bot_user.first_name}. Ik heb op het moment geen vragen voor je, sorry!")
  end
end