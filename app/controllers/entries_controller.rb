class EntriesController < ApplicationController

  def new
    @sample       = Sample.find(params[:sample_id])
    @observation  = @sample.observation
    @protocol     = GenerateSurveyProtocolForm.new(@observation.protocol.entry_fields, EntryForm)
    @entry        = @protocol.form_class.new(entry: Entry.new)
  end

  def create
    @sample       = Sample.find(params[:sample_id])
    @observation  = @sample.observation
    @protocol     = GenerateSurveyProtocolForm.new(@observation.protocol.entry_fields, EntryForm)
    entry         = Entry.new(sample_id: params[:sample_id])

    form = @protocol.form_class.new(entry: entry, data: OpenStruct.new)
    if form.validate(params[:entry])
      save_form(form)
      redirect_to new_sample_entry_path(@sample)
    else
      render :new
    end
  end


private

  def save_form form
    form.save do |hash|
      data = {}
      @protocol.each_field do |field|
        data[field.label] = form.send(field.name)
      end

      Entry.create(hash[:entry].merge(response_data: data, sample_id: params[:sample_id], taxon: nil, taxon_id: 33))
    end
  end

end
