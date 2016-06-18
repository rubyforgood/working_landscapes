class AddSampleFieldsAndEntryFieldsToSurveyProtocol < ActiveRecord::Migration
  def change
    add_column :survey_protocols, :sample_fields, :json
    add_column :survey_protocols, :entry_fields, :json
  end
end
