class SamplesController < ApplicationController

  def new
    @observation   = Observation.find(params[:observation_id])
    @form_generator = GenerateSurveyProtocolForm.new(@observation.protocol.sample_fields, SampleForm)
    @sample_form   = @form_generator.form_class.new(sample: @observation.samples.new, data: OpenStruct.new)
  end

  def create
    observation     = Observation.find(params[:observation_id])
    @form_generator = GenerateSurveyProtocolForm.new(observation.protocol.sample_fields, SampleForm)
    sample          = Sample.new(observation: observation)

    form = @form_generator.form_class.new(sample: sample, data: OpenStruct.new)
    if form.validate(params[:sample])
      save_form(form, sample)
      redirect_to new_sample_entry_path(sample)
    else
      render :new
    end
  end


private

  def save_form(form, sample)
    form.save do |hash|
      data = {}
      @form_generator.each_field do |field|
        data[field.label] = form.send(field.name)
      end

      sample.update!(hash[:sample].merge(response_data: data))
    end
  end
end
