Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create, :update]

  resources :samples do
    resources :entries
  end
end
