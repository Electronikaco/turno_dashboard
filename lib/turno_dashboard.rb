require "turno_dashboard/engine"

module TurnoDashboard

  mattr_accessor :application_controller_class

  def self.application_controller_class
    @@application_controller_class.constantize
  end
  
  class Engine < ::Rails::Engine
  
  end
end
