class DashboardsController < ApplicationController
  def index
    @evaluations = Evaluation.joins(:treatment_process).where(treatment_processes: { creator_id: current_user.id }).where(viewed: false).limit(3)
    @running_treatments_amount = TreatmentProcess.where(creator: current_user, status: "Ongoing").count
  end
end
