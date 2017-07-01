require 'rails_helper'

RSpec.describe Site, type: :model do
  it "model should fail validation if the property is missing" do
    subject = Site.new
    subject.name = "The Farm"
    expect(subject.valid?).to equal false
    expect(subject.errors.messages).to match({:property=>["can't be blank"]})
  end
end
