class ResponsesController < ApplicationController
  def index
    @responses = Response.all

    # label = @response.question.label

  end

  def show
    @response = Response.find(params[:id])
    @label = @response.question.label
  end

  def new
    @response = Response.new
    @survey = Survey.first

  end

  def create
    @response = Response.new
    @response.question_id = params[:question_id]
    @response.user_id = params[:user_id]
    @response.answer = params[:answer]

    if @response.save
      redirect_to "/responses/new", :notice => "Response created successfully."
    else
      render 'new'
    end
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
end
