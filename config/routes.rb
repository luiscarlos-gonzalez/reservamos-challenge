Rails.application.routes.draw do
  root 'forecasts#index'
  resources :cities, only: [:index]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
