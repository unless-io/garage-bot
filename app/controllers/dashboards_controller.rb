class DashboardsController < ApplicationController
  def index
    @coached_treatments = TreatmentProcess.where(creator_id: current_user.id).group_by(&:status)
  end
end
