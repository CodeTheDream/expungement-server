source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'pg_search'
gem 'devise'
gem 'devise-i18n'
gem 'roo-xls'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'rubocop'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'rb-readline'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'better_errors'
  gem 'foreman'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem "binding_of_caller"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
end
