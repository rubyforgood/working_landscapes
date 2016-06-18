require 'rails_helper'

RSpec.feature "Survey Type Creation", type: :feature do
  before {
    visit '/survey_types/new'

    expect(page).to have_text("Create new survey type")

    fill_in "Title", with: "Sample Survey"
    click_button "Create"
  }

  scenario "User creates new survey type" do
    expect(current_path).to eq(edit_survey_type_path(SurveyType.last))
    expect(page).to have_text("Sample Survey")
  end

  scenario "User adds fields to the new survey type" do
    click_button "Add new field"

    fill_in "Field name", with: "Grass height"
    select  "Dropdown", from: "Field type"
  end
end
