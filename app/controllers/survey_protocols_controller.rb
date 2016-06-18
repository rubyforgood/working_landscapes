class SurveyProtocolsController < ApplicationController

  def new
    @survey_protocol = SurveyProtocol.new
  end

  def create
    @survey_protocol = SurveyProtocol.new(strong_params)
    if @survey_protocol.save!
      redirect_to edit_survey_protocol_path(@survey_protocol)
    else
      flash[:message] = "Title is required"
      render :new
    end
  end

  def edit
    @survey_protocol = SurveyProtocol.find(params[:id])
  end

  def update
    @survey_protocol = SurveyProtocol.find(params[:id])
    @survey_protocol.update!(sample_fields: params[:fields])
    head :ok
  end

  private

  def strong_params
    params.require(:survey_protocol).permit(:title)
  end
end
