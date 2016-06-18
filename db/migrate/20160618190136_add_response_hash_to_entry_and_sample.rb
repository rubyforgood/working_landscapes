class AddResponseHashToEntryAndSample < ActiveRecord::Migration
  def change
    add_column :samples, :response_data, :hstore
    add_column :entries, :response_data, :hstore
  end
end
