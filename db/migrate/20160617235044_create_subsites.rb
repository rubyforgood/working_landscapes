class CreateSubsites < ActiveRecord::Migration
  def change
    create_table :subsites do |t|
      t.string :name, null: false
      t.belongs_to :site, null: false, index: true

      t.timestamps null: false
    end
  end
end
