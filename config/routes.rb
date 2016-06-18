Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :survey_types, only: [:new, :edit, :create]
  resources :survey_fields, only: [:create]
end
