class BotConversationService
  def initialize(attributes)
    @message = attributes[:message]
    @current_bot_user = User.find_by_facebook_id(@message.sender["id"])
  end

  def call
    Message.create(content: @message.text, user: @current_bot_user)
    if pending_evaluations?
      if @current_bot_user.conversation_accepted
        initiate_questionaire_handler
      else
        if @message.text.downcase == "ja" || @message.text.downcase == "ik ben klaar" || @message.text.downcase == "ik ben er klaar voor" || @message.text.downcase == "yes"
          @current_bot_user.conversation_accepted = true
          @current_bot_user.save
          initiate_questionaire_handler
        else
          BotConversationAcceptService.new(message: @message, current_bot_user: @current_bot_user).call
        end
      end
    else
      no_questionaire_assigned_handler
    end
  end

  private

  def initiate_questionaire_handler
    set_pending_evaluations
    questionaire_handler
  end

  def set_pending_evaluations
    @pending_evaluations = @current_bot_user.pending_evaluations
  end

  def pending_evaluations?
    @current_bot_user.pending_evaluations.any?
  end

  def questionaire_handler
    BotQuestionaireHandlingService.new(message: @message, pending_evaluations: @pending_evaluations, current_bot_user: @current_bot_user).call
  end

  def no_questionaire_assigned_handler
    BotNoCurrentQuestionaireService.new(message: @message, current_bot_user: @current_bot_user).call
  end
end