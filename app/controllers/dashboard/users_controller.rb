class Dashboard::UsersController < ApplicationController
  def index
    @user = User.where(admin: false)
  end

  def show
    @treatment_process = TreatmentProcess.new
    @questionaires = Questionaire.all
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def set_user
  end
end
