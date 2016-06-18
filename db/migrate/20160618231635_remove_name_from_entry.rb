class RemoveNameFromEntry < ActiveRecord::Migration
  def change
    remove_column :entries, :name, :string
  end
end
