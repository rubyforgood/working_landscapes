class AddObservationToSample < ActiveRecord::Migration
  def change
    add_reference :samples, :observation, index: true, foreign_key: true, null:false
  end
end
