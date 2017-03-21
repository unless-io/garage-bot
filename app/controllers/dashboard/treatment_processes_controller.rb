class TreatmentProcessesController < ApplicationController
  before_action :set_treatment_proces, only: [:show, :edit, :update, :destroy]
  def index
    @treatments = TreatmentProcess.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_treatment_proces
    @treatment = TreatmentProcess.find(params[:id])
  end

  def treatment_proces_params
    params.require(:treatment_process).permit(:client_id, :creator_id, :frequency, :duration, :start_date, :questionaire_id)
  end
end
