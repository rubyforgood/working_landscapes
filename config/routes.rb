Rails.application.routes.draw do
  resources :forms, only: [:update]


end
