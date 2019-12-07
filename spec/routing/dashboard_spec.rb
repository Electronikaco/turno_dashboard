require 'rails_helper'

RSpec.describe 'TurnoDashboard::DashboardController', type: :routing do
  routes { TurnoDashboard::Engine.routes }
  let(:base_url) { '/dashboard' }
  let(:base_controller) { 'turno_dashboard/dashboard' }

  it 'routes to #index' do
    expect(get: "#{base_url}").to route_to( "#{base_controller}#index")
  end
end