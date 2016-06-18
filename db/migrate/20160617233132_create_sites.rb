class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string      :name,      null: false
      t.references  :property,  null: false, index: true

      t.timestamps null: false
    end
  end
end
