class BotAnswerRegistrationService
  def initialize(attributes)
    @message = attributes[:message]
    @pending_evaluation = attributes[:pending_evaluation]
    @current_bot_user = attributes[:current_bot_user]
  end

  def call
    @questionaire = @pending_evaluation.questionaire
    position = @pending_evaluation.progress - 1
    @previous_question = @questionaire.questions[position]
    if position.zero?
      @evaluation = Evaluation.create(questionaire: questionaire, user: @current_bot_user)
    else
      @evaluation = Eveluation.where(questionaire: @questionaire)
    else
      check_answer_type
    end
  end

  private

  def check_answer_type
    if @message.payload.nil?
      answer_without_payload
    else
      answer_with_payload
    end
  end

  def answer_with_payload
    @evaluation.answers << Answer.create(content: @message.payload, evaluation: @evaluation)
  end

  def answer_without_payload
    @evaluation.answers << Answer.create(content: @message.text, evaluation: @evaluation)
  end
end