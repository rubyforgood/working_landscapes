Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'dashboard#show'

  resources :survey_protocols, only: [:new, :edit, :create, :update, :index] do
    resource :entry_fields, only: [:edit, :update]
  end

  resources :observations do
    resources :samples, shallow: true do
      resources :entries, shallow: true
    end
  end

  get "/ujs/ac/:resource/:field" => "ujs#autocomplete", as: 'ujs_autocomplete'

end
