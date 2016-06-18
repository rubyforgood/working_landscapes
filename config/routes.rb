Rails.application.routes.draw do
  resources :forms, only: [:update]


  root to: 'dashboard#show'

  resources :survey_types, only: [:new, :edit, :create]
  resources :survey_fields, only: [:create]
end
