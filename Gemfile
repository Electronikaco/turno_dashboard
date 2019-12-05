source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in turno_dashboard.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem 'rails', '5.2.1'

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'readapt'
  gem 'bundler-audit'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'fasterer'
  gem 'rails_best_practices'
  gem 'reek'
  gem 'rubocop', '~> 0.58.2', require: false
  gem 'rubocop-airbnb'
  gem 'rubocop-rspec'
  gem 'ruby-debug-ide'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'squasher', '>= 0.6.0', git: 'https://github.com/yellowme/squasher.git'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'fuubar'
  gem 'rspec-benchmark'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'webmock'
  # http://vvv.tobiassjosten.net/ruby-on-rails/fixing-readline-for-the-ruby-on-rails-console/3
  # this gem may be removed in newer versions
  gem 'json_schemer'
  gem 'rb-readline'
  gem 'simplecov', require: false
end
