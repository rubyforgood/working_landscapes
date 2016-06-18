Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'dashboard#show'

  resources :survey_types, only: [:new, :edit, :create]
  resources :survey_fields, only: [:create]
end
