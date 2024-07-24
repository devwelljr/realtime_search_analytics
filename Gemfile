source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.0.6"

gem "sprockets-rails"

gem "pg"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "stimulus-rails"

gem "jbuilder"

gem 'jquery-rails'

gem 'bootstrap', '~> 4.5.2'

gem 'sass-rails', '>= 5.0'

gem 'toastr-rails', '~> 1.0', '>= 1.0.3'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem "byebug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "rspec"
  gem "selenium-webdriver"
  gem "webdrivers"
end
