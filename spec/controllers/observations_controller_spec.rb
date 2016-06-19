require 'rails_helper'

RSpec.describe ObservationsController, type: :controller do
  before do
    @property = Property.create(name: "Test Property")
    @site = Site.create(name: "Test Site", property: property)
  end

  describe "create" do
    it "accepts params" do
      post :create, observation: { "property_id" => @property.id, "site_id" => @site.id }
    end
  end
  describe "edit" do
    observation = Observation.create(property_id: @property.id, site_id: @site.id)
    get :edit, observation.id
  end
end
