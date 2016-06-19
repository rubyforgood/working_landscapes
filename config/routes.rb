Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create, :update, :index] do
    resource :entry_fields, only: [:edit, :update]
  end

  resources :samples do
    resources :entries
  end
end
