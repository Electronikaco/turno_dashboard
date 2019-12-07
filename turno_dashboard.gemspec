$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "turno_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "turno_dashboard"
  s.version     = TurnoDashboard::VERSION
  s.authors     = ["Cesar A Sulbaran"]
  s.email       = ["cesulbaran@gmail.com"]
  s.homepage    = "https://github.com/Electronikaco/turno_dashboard"
  s.summary     = "Dashboard"
  s.description = "Modulo Engine, [Dashboard]"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]


  s.add_dependency 'rails', '~> 5.2.1'

  s.add_development_dependency "sqlite3"
  s.test_files = Dir["spec/**/*"]            
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rails_best_practices'
  s.add_development_dependency 'rubocop-airbnb'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'dotenv-rails'
  s.add_development_dependency 'mysql2'
end
