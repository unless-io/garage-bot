class BotFirstVisitService
  def initialize(attributes)
    @message = attributes[:message]
  end

  def call
    initial_synchronisation_message(@message.sender["id"])
  end

  private

  def initial_synchronisation_message(sender_id)
    @message.reply(text: "Welkom bij de Garagebot! Klik op deze link om je account te activeren! \n\n #{ENV["BASE_URL"]}facebook_account_link?fb_messenger_id=#{sender_id}")
  end
end