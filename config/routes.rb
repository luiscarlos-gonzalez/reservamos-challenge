Rails.application.routes.draw do
  root 'forecasts#index'
  resources :forecasts, only: [:index, :create]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
