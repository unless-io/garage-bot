class GarageBotService
  include GarageBotHelper
  def initialize(attributes)
    @message = attributes[:message]
  end

  def call
    unless bot_user_exists?(@message.sender["id"])
      initial_synchronisation_message(@message.sender["id"])
    end

    @message.reply(text: "Hello, #{@current_bot_user.first_name}!")
    @message.reply(text: "You said '#{@message.text}'")
    
  end
end