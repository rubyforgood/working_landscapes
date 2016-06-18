class RenameSurveyTypeToSurveyProtocol < ActiveRecord::Migration
  def change
    rename_table :survey_types, :survey_protocols
  end
end
