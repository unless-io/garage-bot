class Dashboard::QuestionairesController < ApplicationController
  before_action :set_questionaire, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @question = Question.new
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
  end

  private
  def set_questionaire
    @questionaire = Questionaire.find(params[:id])
  end

  def questionaire_params
    params.require(:questionaire).permit(:title, :instruction)
  end
end
