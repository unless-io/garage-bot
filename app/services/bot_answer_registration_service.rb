class BotAnswerRegistrationService
  def initialize(attributes)
    @message = attributes[:message]
    @pending_evaluation = attributes[:pending_evaluation]
    @current_bot_user = attributes[:current_bot_user]
  end

  def call
    @questionaire = @pending_evaluation.treatment_process.questionaire
    position = @pending_evaluation.progress - 1
    @previous_question = @questionaire.questions[position]
    if position.zero?
      @evaluation = Evaluation.create(treatment_process: @pending_evaluation.treatment_process, user: @current_bot_user)
    else
      @evaluation = Evaluation.find_by_treatment_process_id(@pending_evaluation.treatment_process.id)
    end
    check_answer_type
  end

  private

  def check_answer_type
    # if @message.payload.nil?
      answer_without_payload
    # else
    #   answer_with_payload
    # end
  end

  def answer_with_payload
    @evaluation.answers << Answer.create(content: @message.payload, evaluation: @evaluation, question: @previous_question)
  end

  def answer_without_payload
    @evaluation.answers << Answer.create(content: @message.text, evaluation: @evaluation, question: @previous_question)
  end
end