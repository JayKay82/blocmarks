source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'

# Rails webserver
gem 'puma', group: [:development, :production]

# Development and test database
gem 'sqlite3', group: [:development, :test]

# Production database
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Testing environment
group :test, :development do
  gem 'rspec-rails', '~>3.0'
  gem 'capybara'
  gem 'factory_girl_rails', '~>4.0'
  gem 'shoulda-matchers'
end

# Authentication, authorization, and security
gem 'devise'
gem 'cancan'
gem 'figaro', '1.0'

# Gems for markup and styling
gem 'haml'
gem 'erb2haml', group: :development
gem 'sass-rails', '~> 5.0'
gem 'foundation-rails'

# Gems for JS
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

# Miscellaneous gems
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'faker', group: :development

# Gems for debugging
group :development, :test do
  gem 'rubocop', require: false
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
