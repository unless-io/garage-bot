class Dashboard::QuestionsController < ApplicationController
  def create
    @questionaire = Questionaire.find(params[:template_id])
    @question = Question.new(question_params)
    @question.questionaire = @questionaire
    if @question.save
      redirect_to dashboard_template_path(@questionaire)
    else
      render 'dashboard/templates'
      # not sure about this
    end
  end

  private

  def question_params
    params.require(:question).permit(:type, :content)
  end
end
