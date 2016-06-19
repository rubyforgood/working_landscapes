class SamplesController < ApplicationController

  def new
    @observation   = Observation.find(params[:observation_id])
    @form_generator = GenerateSurveyProtocolForm.new(@observation.protocol.sample_fields, SampleForm)
    @sample_form   = @form_generator.form_class.new(sample: @observation.samples.new, data: OpenStruct.new)
  end

end
