module TurnoDashboard
  class Engine < ::Rails::Engine
    isolate_namespace TurnoDashboard
    config.generators do |generators|
      generators.test_framework :rspec
      generators.fixture_replacement :factory_bot
      generators.factory_bot dir: 'spec/factories'
    end
  end
end
