class DashboardsController < ApplicationController
  def index
    @evaluations = Evaluation.joins(:treatment_process).where(treatment_process: { creator_id: current_user.id })
  end
end
