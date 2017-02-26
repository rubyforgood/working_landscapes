require "rails_helper"

RSpec.describe "User navigates to New Protocol page ", type: :feature do
  scenario "the link to Manage Protocol page" do
    visit survey_protocols_path
    click_on "Add a New Protocol"

    expect(current_path).to eq(new_survey_protocol_path)
  end
end
