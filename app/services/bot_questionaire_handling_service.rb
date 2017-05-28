class BotQuestionaireHandlingService
  def initialize(attributes)
    @message = attributes[:message]
    @pending_evaluations = attributes[:pending_evaluations]
    @current_bot_user = attributes[:current_bot_user]
  end

  def call
    @pending_evaluations.each do |pending_evaluation|
      record_answer(pending_evaluation) unless pending_evaluation.progress.zero?
      if last_question?(pending_evaluation)
        BotConversationEndService.new(user: @current_bot_user, message: @message).call
        pending_evaluation.destroy
        @current_bot_user.conversation_accepted = false
        @current_bot_user.save
      elsif first_question?(pending_evaluation)
        BotConversationStartService.new(user: @current_bot_user, message: @message, questionaire: pending_evaluation.treatment_process.questionaire).call
        run_questionaire(pending_evaluation)
        update_progress(pending_evaluation)
      else
        run_questionaire(pending_evaluation)
        update_progress(pending_evaluation)
      end
    end
  end

  private

  def last_question?(pending_evaluation)
    (pending_evaluation.progress + 1) > pending_evaluation.treatment_process.questionaire.questions.count
  end

  def first_question?(pending_evaluation)
    pending_evaluation.progress == 0
  end

  def run_questionaire(pending_evaluation)
    questionaire = pending_evaluation.treatment_process.questionaire
    question = questionaire.questions[pending_evaluation.progress]
    if question.question_options.any?
      multiple_choice_question(question)
    elsif question.category == "Yes/No"
      yes_no_question(question)
    elsif question.category == "Scale"
      scale_question(question)
    else
      @message.reply(text: question.content)
    end
  end

  def update_progress(pending_evaluation)
    pending_evaluation.progress += 1
    pending_evaluation.save
  end

  def record_answer(pending_evaluation)
    BotAnswerRegistrationService.new(message: @message, pending_evaluation: pending_evaluation, current_bot_user: @current_bot_user).call
  end

  def multiple_choice_question(question)
    @message.reply(
      text: question.content,
      quick_replies: generate_options_array(question)
      )
  end

  def scale_question(question)
    @message.reply(
      text: question.content,
      quick_replies: generate_scale_quick_replies
      )
  end

  def yes_no_question(question)
    @message.reply(
      text: question.content,
      quick_replies: [
        { content_type: 'text', title: 'Yes', payload: 'Yes' },
        { content_type: 'text', title: 'No', payload: 'No' }
      ]
      )
  end

  def generate_scale_quick_replies
    quick_replies = []
    5.times do |number|
      quick_replies << { content_type: 'text', title: (number + 1), payload: (number + 1) }
    end
    return quick_replies
  end

  def generate_options_array(question)
    results = []
    question.question_options.each do |question_option|
      results << { content_type: 'text', title: question_option.content, payload: question_option.content }
    end
    return results
  end
end