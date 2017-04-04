class Dashboard::QuestionairesController < ApplicationController
  before_action :set_questionaire, only: [:show, :edit, :update, :destroy]

  def index
    @questionaires = Questionaire.all
  end

  def show
    @question = Question.new
    @question.question_options.build
    check_evaluations_size
  end

  def new
    @questionaire = Questionaire.new
  end

  def create
    @questionaire = Questionaire.new(questionaire_params)

    if @questionaire.save
      redirect_to dashboard_template_path(@questionaire)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @questionaire.destroy
    redirect_to dashboard_templates_path
  end

  private

  def check_evaluations_size
    @evaluations = Evaluation.where(questionaire_id: @questionaire.id)
    if @evaluations.size == 0
      @text_evaluations = "no evaluations for this questionaire"
    elsif @evaluations.size == 1
      @text_evaluations = "1 evaluation for this questionaire"
    else
      @text_evaluations = "#{@evaluations.size} evaluations for this questionaire"
    end
  end

  def set_questionaire
    @questionaire = Questionaire.find(params[:id])
  end

  def questionaire_params
    params.require(:questionaire).permit(:title, :instruction)
  end
end
