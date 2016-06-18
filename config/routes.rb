Rails.application.routes.draw do
<<<<<<< 707eadc206bb9e31892e79d6e9fe1db14ba82029
  resources :forms, only: [:update]


=======
  root to: 'dashboard#show'

  resources :survey_types, only: [:new, :edit, :create]
>>>>>>> add initial survey type creation
end
