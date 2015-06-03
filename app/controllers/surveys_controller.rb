class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new
    @survey.admin_id = params[:admin_id]
    @survey.title = params[:title]

    if @survey.save
      redirect_to "/surveys", :notice => "Survey created successfully."
    else
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])

    @survey.admin_id = params[:admin_id]
    @survey.title = params[:title]

    if @survey.save
      redirect_to "/surveys", :notice => "Survey updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])

    @survey.destroy

    redirect_to "/surveys", :notice => "Survey deleted."
  end
end
