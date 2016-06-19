class AddSiteIdToObservations < ActiveRecord::Migration
  def change
    change_table :observations do |t|
      t.references :site, index: true, null: false
    end
  end
end
