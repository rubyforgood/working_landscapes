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

    form = @protocol.form_class.new(entry: Entry.new, data: OpenStruct.new)
    form.validate(params[:entry])

    form.save do |hash|
      data = {}
      @protocol.each_field do |field|
        data[field.label] = form.send(field.name)
      end

      Entry.create(hash[:entry].merge(response_data: data, sample_id: params[:sample_id], taxa: nil, taxa_id: 33))
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


end
