class Dashboard::QuestionsController < ApplicationController
  def create
    @questionaire = Questionaire.find(params[:template_id])
    @question = Question.new(question_params)
    @question.questionaire = @questionaire
    if @question.save
      respond_to do |format|
        format.html { redirect_to dashboard_template_path(@questionaire) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
       respond_to do |format|
        format.html { render 'dashboard/templates/show' }       # not sure about this
        format.js  # <-- idem
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:category, :content)
  end
end
