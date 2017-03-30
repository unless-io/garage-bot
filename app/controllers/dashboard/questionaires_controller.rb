class Dashboard::QuestionairesController < ApplicationController
  before_action :set_questionaire, only: [:show, :edit, :update, :destroy]

  def index
    @questionaires = Questionaire.all
  end

  def show
    @question = Question.new
    @question.question_options.build
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
  def set_questionaire
    @questionaire = Questionaire.find(params[:id])
  end

  def questionaire_params
    params.require(:questionaire).permit(:title, :instruction)
  end
end
