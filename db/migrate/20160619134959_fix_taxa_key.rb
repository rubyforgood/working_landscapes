class FixTaxaKey < ActiveRecord::Migration
  def change
    rename_column :entries, :taxa_id, :taxon_id
    add_index :entries, :taxon_id
  end
end
