class SurveyTypesController < ApplicationController
  def new
    @survey_type = SurveyType.new
  end

  def create
    @survey_type = SurveyType.new(strong_params)
    if @survey_type.save!
      redirect_to edit_survey_type_path(@survey_type)
    else
      flash[:message] = "Title is required"
      render :new
    end
  end

  def edit
    @survey_type = SurveyType.find(params[:id])
  end

  private

  def strong_params
    params.require(:survey_type).permit(:title)
  end
end
