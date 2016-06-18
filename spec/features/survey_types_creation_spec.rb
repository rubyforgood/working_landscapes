require 'rails_helper'

RSpec.feature "Survey Protocol Creation", type: :feature do
  before {
    visit '/survey_protocols/new'

    expect(page).to have_text("Create new survey protocol")

    fill_in "Title", with: "Sample Survey"
    click_button "Create"
  }

  scenario "User creates new survey protocol" do
    expect(current_path).to eq(edit_survey_protocol_path(SurveyProtocol.last))
    expect(page).to have_text("Sample Survey")
  end

  scenario "User adds fields to the new survey type" do
    click_button "Add new field"

    fill_in "Field name", with: "Grass height"
    select  "Dropdown", from: "Field type"
  end
end
