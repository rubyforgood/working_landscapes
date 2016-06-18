class EntriesController < ApplicationController

  def new
    @protocol     = GenerateSurveyProtocolForm.new(fixture)
    @sample       = Sample.new(id: params[:sample_id])
    @entry        = Entry.new
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
