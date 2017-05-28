class Dashboard::CheckpointsController < ApplicationController
  before_action :set_treatment, only: [:destroy_all_checkpoints]
  before_action :set_checkpoint, only: [:destroy]

  def destroy
    @checkpoint.destroy
    flash[:notice] = "Succsfully removed checkpoint for #{@checkpoint.scheduled_day}"
  end

  def destroy_all_checkpoints
    @treatment.checkpoints.destroy_all
    flash[:notice] = "Succsfully removed all checkpoints for #{@treatment.client.full_name}"
  end

  private

  def set_treatment
    @treatment = TreatmentProcess.find(params[:treatment_id])
  end

  def set_checkpoint
    @checkpoint = Checkpoint.find(params[:id])
  end
end