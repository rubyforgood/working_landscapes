class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :subsite, null: false, index: true
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
