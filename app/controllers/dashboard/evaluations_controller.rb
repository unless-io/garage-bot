class Dashboard::EvaluationsController < ApplicationController
  def show
    @evaluation = Evaluation.find(params[:id])
    unless @evaluation.viewed == true
      @evaluation.update(viewed: true)
    end
  end
end
