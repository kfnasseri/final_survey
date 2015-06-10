class ResponsesController < ApplicationController
  def index
    @responses = Response.all
    @surveys = Survey.find_by_id(params[:survey_id])

  end

  def show
    @response = Response.find(params[:id])
    @label = @response.question.label
  end

  def new
    @survey = Survey.find_by_id(params[:survey_id]) || Survey.first
    @responses = []
    @survey.questions.each do |question|
      @responses.push(Response.new(question_id: question.id))
    end
  end

  def create
    @survey = Survey.find_by_id(params[:survey_id]) || Survey.first
    @responses = params[:question_id].map.with_index do |question_id, index|
      response = Response.new(question_id: question_id, user_id: current_user.id)
      response.answer = params[:answer][index]
      response
    end

    any_invalid = @responses.find_all(&:invalid?).any?
    return render 'new' if any_invalid
    @responses.each(&:save)
    redirect_to "/submission", :notice => "Response created successfully."
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])

    @response.question_id = params[:question_id]
    @response.user_id = params[:user_id]
    @response.answer = params[:answer]

    if @response.save
      redirect_to "/responses", :notice => "Response updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    redirect_to "/responses", :notice => "Response deleted."
  end

  def submission

  end

  def choose
    @surveys = Survey.all

  end


end
