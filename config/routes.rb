Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create, :update, :index] do
    resource :entry_fields, only: [:edit, :update]
  end

  resources :observations do
    resources :samples, shallow: true do
      resources :entries, shallow: true
    end
  end
end
