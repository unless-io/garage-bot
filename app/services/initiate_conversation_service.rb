include Facebook::Messenger
include GarageBotHelper

class InitiateConversationService
  def initialize(attributes)
    @pending_evaluation = attributes[:pending_evaluation]
  end

  def call
    Bot.deliver({
      recipient: {
        id: @pending_evaluation.user.facebook_id
        },
        message: {
          text: 'Hello, are you ready for your evaluation today?',
          quick_replies: [
            { content_type: 'text', title: "I'm ready", payload: 'Yes' },
            { content_type: 'text', title: 'No', payload: 'No' }
          ]
        }
        }, access_token: ENV['ACCESS_TOKEN']
        )
  end
end

