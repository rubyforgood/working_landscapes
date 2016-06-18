require 'rails_helper'

describe GenerateSurveyProtocolForm do

  let(:input) {
    { "fields" => [
      {"label" => "Please enter your clearance number","field_type" => "text","required" => true,"field_options" => {},"cid" => "c6"},
      {"label" => "Please enter your clearance number Copy","field_type" => "text","required" => true,"field_options" => {},"cid" => "c18"},
      {"label" => "Security personnel #82?","field_type" => "radio","required" => true,"field_options" => {"options" => [{"label" => "Yes","checked" => false},{"label" => "No","checked" => false}],"include_other_option" => true},"cid" => "c10"},
      {"label" => "Medical history","field_type" => "file","required" => true,"field_options" => {},"cid" => "c14"},
      {"label" => "Untitled","field_type" => "radio","required" => true,"field_options" => {"options" => [{"label" => "","checked" => false},{"label" => "","checked" => false}]},"cid" => "c14"},
      {"label" => "Untitled","field_type" => "section_break","required" => true,"field_options" => {},"cid" => "c25"},
      {"label" => "Untitled","field_type" => "text","required" => true,"field_options" => {"size" => "small"},"cid" => "c29"},
      {"label" => "Hello","field_type" => "checkboxes","required" => true,"field_options" => {"options" => [{"label" => "A","checked" => true},{"label" => "B","checked" => true}]},"cid" => "c33"}
    ]}
  }

  describe "field iteration" do

    it "provides an enumerator over provided fields" do
      fields = described_class.new(input)

      expect(fields.each_field.map{|f| f.label }.to_a[3]).to eq "Medical history"
    end

  end

end
