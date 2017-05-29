class Dashboard::TreatmentProcessesController < ApplicationController
  before_action :set_treatment_process, only: [:show, :edit, :update, :destroy]
  def index
    @treatments = TreatmentProcess.where(creator_id: current_user.id).group_by(&:status).sort_by { |key, value| key }.reverse
  end

  def show
    @message = TreatmentStatusService.new(treatment: @treatment).call
  end

  def new
    @treatment = TreatmentProcess.new
    @users = User.where.not(facebook_id: nil).order(:last_name)
    @questionaires = Questionaire.all
    @frequency_options = %w(daily weekly)
    @duration_options = ["one_week", "two_weeks", "one_month", "three_months"]
  end

  def create
    @treatment = TreatmentProcess.new(treatment_process_params)
    if @treatment.save
      CheckpointCreationService.new(treatment: @treatment).call
      redirect_to  dashboard_treatment_path(@treatment)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_treatment_process
    @treatment = TreatmentProcess.find(params[:id])
  end

  def treatment_process_params
    params.require(:treatment_process).permit(:client_id, :creator_id, :frequency, :duration, :start_date, :questionaire_id)
  end
end
