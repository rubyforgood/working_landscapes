class DefaultCountsToOne < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.change_default  "count", 1
    end
  end
end
