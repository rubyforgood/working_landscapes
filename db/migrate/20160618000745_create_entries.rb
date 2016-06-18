class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :sample, null: false, index: true
      t.references :taxa, null: false

      t.integer :count, default: 0
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
