require 'rails_helper'

RSpec.describe ObservationsController, type: :controller do
  before do
    @property = Property.create(name: "Test Property")
    @site = Site.create(name: "Test Site", property: @property)
    @protocol = SurveyProtocol.create(title: "Bees!")
  end


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
end
