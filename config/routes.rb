Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#index'  

  resources :accounts, only: [:show]

end
