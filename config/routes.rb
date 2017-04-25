Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Redirect to root of site after Admin account logs out
  ActiveAdmin::Devise::SessionsController.class_eval do
    def after_sign_out_path_for(resource_or_scope)
      "/"
    end
  end

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
