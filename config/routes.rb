Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create, :update]

  resources :samples do
    resources :entries
  end
end
