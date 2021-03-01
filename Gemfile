source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'devise'
gem 'kaminari'
gem 'rails', '~> 5.2.1'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'carrierwave'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem "rspec_junit_formatter"
  gem 'capybara', '~> 2.15.2'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'rubocop-airbnb'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
