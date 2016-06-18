class CreateTaxa < ActiveRecord::Migration
  def change
    create_table :taxa do |t|
      t.string :family, null: false
      t.string :genus
      t.string :species

      t.string :common_name
      t.string :code

      t.timestamps null: false
    end
  end
end
