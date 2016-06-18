class CreateSurveyTypes < ActiveRecord::Migration
  def change
    create_table :survey_types do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
