class AddObservationIdToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :observation_id, :integer
  end
end
