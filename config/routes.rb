TurnoDashboard::Engine.routes.draw do
  resources :dashboard, only: [:index] do
    collection do
      get :about
    end
  end
end