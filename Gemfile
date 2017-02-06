source 'https://rubygems.org'

ruby '2.3.3' # waiting on https://github.com/rails/rails/issues/25125 to upgrade further
gem 'rails', '~> 4.2.7'

#gem "activeadmin_sortable_table" # https://github.com/bolshakov/activeadmin_sortable_table
gem 'activeadmin', '~> 1.0.0.pre2'
gem 'activeadmin-reform', '~> 0.1.4' # https://github.com/bolshakov/activeadmin-reform
gem 'activeadmin_addons', '~> 0.9.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', '~> 3.2' # for activeadmin
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0.5' # later versions break Sprockets import of jquery-ui/datepicker
gem 'json', '~> 1.8' # 1.8.5+ supports Ruby 2.4
gem 'pg', '~> 0.15'
gem 'reform-rails'
gem 'sass', '3.4' # later versions break on Rails 4.2
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'simple_form'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'capybara'
  gem 'db_fixtures_dump'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'puma', '~> 3.4'
  gem 'rails_12factor', '~> 0.0.3'
end
