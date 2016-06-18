class IndexHstoreColumns < ActiveRecord::Migration
  def up
    execute 'CREATE INDEX samples_response_data ON samples USING gin(response_data)'
    execute 'CREATE INDEX entries_response_data ON entries USING gin(response_data)'
  end

  def down
    execute 'DROP INDEX samples_response_data'
    execute 'DROP INDEX entries_response_data'
  end
end
