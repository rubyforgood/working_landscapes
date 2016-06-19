namespace :db do
  desc "Seed from fixtures"
  task seed_fixtures: :environment do
    require 'active_record/fixtures'
    fixtures_dir = File.join(Rails.root, '/spec/fixtures') #change '/spec/fixtures' to match your fixtures location
    Dir.glob(File.join(fixtures_dir,'*.yml')).each do |file|
      base_name = File.basename(file, '.*')
      puts "Loading #{base_name}..."
      ActiveRecord::Fixtures.create_fixtures(fixtures_dir, base_name)
    end
  end
end
