class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.answer_type = params[:answer_type]
    @question.survey_id = params[:survey_id]
    @question.label = params[:label]

    if @question.save
      redirect_to "/surveys/#{@question.survey_id}", :notice => "Question created successfully."
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    @question.answer_type = params[:answer_type]
    @question.survey_id = params[:survey_id]
    @question.label = params[:label]

    if @question.save
      redirect_to "/questions", :notice => "Question updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.destroy

    redirect_to "/questions", :notice => "Question deleted."
  end
end
