class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.timestamp :date
      t.references :protocol, index: true

      t.timestamps null: false
    end
  end
end
