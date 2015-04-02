source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# gem 'puma' Error with windows

# Use only this gems for Windows Platforms
gem 'tzinfo-data', :platform => [:mswin, :mingw] # Trouver un fix pour :cygwin si c'est la version d'Arthur.

gem 'sass-rails', '~> 5.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'underscore-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'dalli'

gem 'foundation-rails', '~> 5.4.0'
gem 'foundation_rails_helper'
gem 'devise', "~>3.4.0"
gem "rolify", "3.4.1"
gem 'activeadmin', github: 'activeadmin'
gem 'rails-i18n', '~> 4.0.0' # For 4.0.x
gem 'twilio-ruby'

group :production do
	gem 'pg'
	gem 'newrelic_rpm'
end

gem "better_errors"
gem "binding_of_caller"

group :development, :test do
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	gem 'annotate', '~> 2.6.5'
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
end
# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0'
gem 'simplecov', :require => false, group: :test
