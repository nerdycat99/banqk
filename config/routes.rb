Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#index'  

  resources :accounts, only: [:show] do
    resources :transactions, only: [:new, :create]
  end
end
