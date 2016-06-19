class SimplifyTaxa < ActiveRecord::Migration
  def change
    change_table :taxa do |t|
      t.string :scientific_name, index: true
      t.remove :family
      t.remove :genus
      t.remove :species
    end

  end
end
