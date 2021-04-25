source 'https://rubygems.org'

ruby '2.6.6'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'faraday'
gem 'multi_json'
gem 'oj'
gem 'tzinfo', '~> 1'
gem 'telegram-bot-ruby'

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  gem 'puma'
end
