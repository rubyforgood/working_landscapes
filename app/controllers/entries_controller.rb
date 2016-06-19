class EntriesController < ApplicationController

  def new
    @protocol     = GenerateSurveyProtocolForm.new(fixture)
    @sample       = Sample.new(id: params[:sample_id])
    @entry        = @protocol.form_class.new(entry: Entry.new)
  end

  def create
    @protocol     = GenerateSurveyProtocolForm.new(fixture)
    @sample       = Sample.new(id: params[:sample_id])
    entry         = Entry.new(sample_id: params[:sample_id])

    form = @protocol.form_class.new(entry: entry, data: OpenStruct.new)
    if form.validate(params[:entry])
      @entry = save_form(form)
      redirect_to new_sample_entry_path(@sample)
    else
      render :new
    end
  end

private

  def fixture
    { "fields" => [
      { "label" => "Flowering","field_type" => "dropdown","required" => true,"field_options" => {},"cid" => "c24"},
      { "label" => "Grass/Forb/Wood","field_type" => "dropdown","required" => true,
        "field_options" => {"options" => [
          {"label" => "Grass","checked" => true},
          {"label" => "Forb","checked" => false},
          {"label" => "Wood","checked" => false},
          {"label" => "","checked" => false}
      ],"include_blank_option" => true},"cid" => "c54"}
    ]}
  end

  def save_form form
    form.save do |hash|
      data = {}
      @protocol.each_field do |field|
        data[field.label] = form.send(field.name)
      end

      Entry.create(hash[:entry].merge(response_data: data, sample_id: params[:sample_id], taxa: nil, taxa_id: 33))
    end
  end


end
