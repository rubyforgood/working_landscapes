Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create, :update] do
    resource :entry_fields, only: [:edit, :update]
  end

  resources :samples do
    resources :entries
  end
end
