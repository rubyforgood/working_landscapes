require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  before do
    @property = Property.create(name: "Test Property")
    @site = Site.create(name: "Test Site", property: @property)
    @protocol = SurveyProtocol.create(title: "Bees!")
    @observation = Observation.create(protocol: @protocol, site_id: @site.id)
  end

end
