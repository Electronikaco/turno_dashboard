require "rails_helper"

  RSpec.describe 'GET /dashboard/', type: :request do

    it 'GET /dashboard/' do

      # When
        get  dashboard_index_path
        response
      
      #Then
      expect(response).to have_http_status :ok
    end
end
