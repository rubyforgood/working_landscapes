class RemoveNullConstraintAndNameColumn < ActiveRecord::Migration
  def change
    change_column_null :taxa, :family, true
    change_column_null :entries, :name, true
    remove_column :samples, :name, :string
  end
end
