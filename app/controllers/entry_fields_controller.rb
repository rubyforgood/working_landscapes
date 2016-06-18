class EntryFieldsController < ApplicationController
  before_action :find_survey_protocol

  def update
    @survey_protocol.update!(entry_fields: params[:fields])
    head :ok
  end

  private

  def find_survey_protocol
    @survey_protocol = SurveyProtocol.find(params[:survey_protocol_id])
  end
end
