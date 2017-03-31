module GarageBotHelper
  def bot_user_exists?(facebook_id)
    if User.find_by_facebook_id(facebook_id).nil?
      return false 
    else 
      return true
    end
  end
end

