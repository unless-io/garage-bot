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
          text: 'Hello, are you ready for your evaluation today?'
        }
        }, access_token: ENV['ACCESS_TOKEN']
        )
  end
end