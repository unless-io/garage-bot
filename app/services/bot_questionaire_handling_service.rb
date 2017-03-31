class BotQuestionaireHandlingService
  def initialize(attributes)
    @message = attributes[:message]
    @pending_evaluations = attributes[:pending_evaluations]
    @current_bot_user = attributes[:current_bot_user]
  end

  def call
    @pending_evaluations.each do |pending_evaluation|
      run_questionaire(pending_evaluation)
      if last_question?(pending_evaluation)
        pending_evaluation.destroy
      else
        pending_evaluation.progress += 1
        pending_evaluation.save
      end
    end
  end

  private

  def last_question?
    (pending_evaluation.progress + 1) == pending_evaluation.questionaire.questions.count
  end

  def run_questionaire(pending_evaluation)
    questionaire = pending_evaluation.questionaire
    record_answer(pending_evaluation) unless pending_evaluation.progress.zero?
    question = questionaire.questions[pending_evaluation.progress]
    if question.question_options.any?
      multiple_choice_question(question)
    elsif question.category = "Yes/No"
      yes_no_question(question)
    elsif question.category = "Scale"
      scale_question(question)
    else
      @message.reply(text: question.content)
    end
  end

  def record_answer(pending_evaluation)
    BotAnswerRegistrationService.new(pending_evaluation: pending_evaluation, current_bot_user: @current_bot_user).call
  end

  def multiple_choice_question(question)
    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: question.content,
          buttons: generate_options_hash(question)
        }
      }
      )
  end

  def scale_question(question)
    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: question.content,
          buttons: generate_scale_buttons
        }
      }
      )
  end

  def yes_no_question(question)
    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: question.content,
          buttons: [
            { type: 'postback', title: 'Yes', payload: 'Yes' },
            { type: 'postback', title: 'No', payload: 'No' }
          ]
        }
      }
      )
  end

  def generate_scale_buttons
    buttons = []
    10.times do |number|
      buttons << { type: 'postback', title: (number + 1), payload: (number + 1) }
    end
    return buttons
  end

  def generate_options_hash(question)
    results = []
    question.question_options.each do |question_option|
      results << { type: 'postback', title: question_option.content, payload: question_option.content },
    end
    return results
  end
end