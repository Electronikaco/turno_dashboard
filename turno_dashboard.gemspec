$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "turno_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "turno_dashboard"
  s.version     = TurnoDashboard::VERSION
  s.authors     = ["Cesar A Sulbaran"]
  s.email       = ["cesulbaran@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TurnoDashboard."
  s.description = "TODO: Description of TurnoDashboard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
