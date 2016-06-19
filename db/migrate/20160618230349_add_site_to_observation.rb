class AddSiteToObservation < ActiveRecord::Migration
  def change
    add_reference :observations, :site, index: true, foreign_key: true, null: false
  end
end
