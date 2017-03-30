class SynchronisationsController < ApplicationController
  def facebook_account_link
    current_user.facebook_id = params[:fb_messenger_id]
    if current_user.save
      redirect_to facebook_account_confirmation_path
    else
      flash[:error] = "Synchronisation failed"
    end
  end

  def facebook_account_confirmation
  end
end