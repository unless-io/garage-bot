class Dashboard::EvaluationsController < ApplicationController
  def index
    Evaluation.all
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

end
