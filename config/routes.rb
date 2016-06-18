Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create]
  resources :survey_fields, only: [:create]

  resources :samples do
    resources :entries
  end
end
