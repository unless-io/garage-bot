class Dashboard::TreatmentProcessesController < ApplicationController
  before_action :set_treatment_process, only: [:show, :edit, :update, :destroy]
  def index
    @treatments = TreatmentProcess.all
  end

  def show
    @message = check_ending
  end

  def new
    @treatment = TreatmentProcess.new
    @users = User.all.order(:last_name)
    @questionaires = Questionaire.all
    @frequency_options = %w(daily weekly monthly)
    @duration_options = ["one_week", "two_weeks", "one_month", "three_months"]
  end

  def create
    @treatment = TreatmentProcess.new(treatment_process_params)
    if @treatment.save
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

  def check_ending
    if @treatment.duration.nil? || @treatment.frequency.nil?
      "Information incomplete, please fill out all fields"
    else
      if Date.today > end_date
        "Process ended"
      else
        "Process ongoing"
      end
    end
  end

  def end_date
    duration_conversion = {
      "one week": 1.week,
      "two weeks": 2.weeks,
      "one month": 1.month,
      "three months": 2.months
    }
    end_date = @treatment.start_date + duration_conversion[@treatment.duration.to_sym]
  end

  def set_treatment_process
    @treatment = TreatmentProcess.find(params[:id])
  end

  def treatment_process_params
    params.require(:treatment_process).permit(:client_id, :creator_id, :frequency, :duration, :start_date, :questionaire_id)
  end
end
