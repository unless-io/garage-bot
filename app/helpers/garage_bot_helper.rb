module GarageBotHelper
  def bot_user_exists?(facebook_id)
    @current_bot_user = User.find_by_facebook_id(facebook_id)
    if @current_bot_user.nil?
      return false 
    else 
      return true
    end
  end

  def initial_synchronisation_message(sender_id)
    @message.reply(text: "#{ENV[:BASE_URL]}facebook_account_link?fb_messenger_id=#{sender_id}")
  end
end

