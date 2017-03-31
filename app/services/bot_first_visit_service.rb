class BotFirstVisitService
  def initialize(attributes)
    @message = attributes[:message]
  end

  def call
    initial_synchronisation_message(@message.sender["id"])
  end

  private

  def initial_synchronisation_message(sender_id)
    @message.reply(text: "#{ENV["BASE_URL"]}facebook_account_link?fb_messenger_id=#{sender_id}")
  end
end