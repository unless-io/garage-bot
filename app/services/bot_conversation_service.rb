class BotConversationService
  def initialize(attributes)
    @message = attributes[:message]
    @current_bot_user = User.find_by_facebook_id(@message.sender["id"])
  end

  def call
    if pending_evaluations?
      set_pending_evaluations
      questionaire_handler
    else
      no_questionaire_assigned_handler
    end
  end

  private

  def set_pending_evaluations
    @pending_evaluations = @user.pending_evaluations
  end

  def pending_evaluations?
    @user.pending_evaluations.any?
  end

  def questionaire_handler
    BotQuestionaireHandlingService.new(message: message, pending_evaluations: @pending_evaluations, current_bot_user: @current_bot_user).call
  end

  def no_questionaire_assigned_handler
    BotNoCurrentQuestionaireService.new(message: message).call
  end
end