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
          text: 'Hallo! Ben je klaar voor je vragen vandaag?',
          quick_replies: [
            { content_type: 'text', title: "Ik ben er klaar voor", payload: 'Yes' },
            { content_type: 'text', title: 'Nee, nog niet', payload: 'No' }
          ]
        }
        }, access_token: ENV['ACCESS_TOKEN']
        )
  end
end

