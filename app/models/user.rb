Rails.application.config.active_record.belongs_to_required_by_default = false

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:facebook]

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to :coach, class_name: "User"
  has_many :treatment_processes
  has_many :questionaires, through: :treatment_processes
  has_many :evaluations
  has_many :pending_evaluations


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    # Monkey patch
    unless auth.credentials.expires_at.nil?
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    end
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
