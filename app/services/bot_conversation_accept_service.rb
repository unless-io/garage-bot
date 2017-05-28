class BotConversationAcceptService
  def initialize(attributes)
    @current_bot_user = attributes[:current_bot_user]
    @message = attributes[:message]
  end

  def call
    @message.reply(
      text: "Let me know when you're ready",
      quick_replies: [
        { content_type: 'text', title: "I'm ready", payload: 'Yes' },
        { content_type: 'text', title: 'No', payload: 'No' }
      ]
      )
  end
end