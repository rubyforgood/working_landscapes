class RemoveSurveyFields < ActiveRecord::Migration
  def change
    drop_table :survey_fields
  end
end
