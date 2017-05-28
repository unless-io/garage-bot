class BotConversationAcceptService
  def initialize(attributes)
    @current_bot_user = attributes[:current_bot_user]
    @message = attributes[:message]
  end

  def call
    @message.reply(
      text: "Laat het me weten als je klaar bent",
      quick_replies: [
        { content_type: 'text', title: "Ik ben klaar", payload: 'Yes' },
        { content_type: 'text', title: 'Nog niet', payload: 'No' }
      ]
      )
  end
end