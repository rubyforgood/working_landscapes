require 'rails_helper'

RSpec.describe ObservationsController, type: :controller do
  before do
    @property = Property.create(name: "Test Property")
    @site = Site.create(name: "Test Site", property: @property)
    @protocol = SurveyProtocol.create(title: "Bees!", sample_fields: [{label: "header 1"}, {label: "header 2"}] )
  end

  let(:observation) { Observation.create(protocol: @protocol, site_id: @site.id) }
  let(:csv_options) { {filename: "#{p}"}}

  it "accepts params" do
    post :create, observation: { "property_id" => @property.id, "site_id" => @site.id }
  end

  it "can edit" do
    observation = Observation.create!(protocol: @protocol, site_id: @site.id)
    get :edit, id: observation.id
  end

  it "can view index" do
    get :index
    expect(response).to render_template :index
  end

  describe "with render_views" do
    render_views

    it "will render sample table partial if protocal has observations" do
      observation
      get :index
      expect(response).to render_template(partial: "_samples_table")
    end

    it "won't render sample_table partial if protocol has no observations" do
      get :index
      expect(response).to_not render_template(partial: "_samples_table")
    end
  end

  it "GET #show will export to CSV" do
    expect(@controller).to receive(:send_data) {
      @controller.render nothing: true
    }
    get :show, id: observation.protocol.id, format: :csv
    expect(response.content_type).to eq "text/csv"
  end
end
