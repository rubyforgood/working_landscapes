class CreateSurveyTypes < ActiveRecord::Migration
  def change
    create_table :survey_types do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
