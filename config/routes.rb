Rails.application.routes.draw do
  devise_for :users
  
  resources :movies do
    resources :comments
  end
  
  root 'movies#index'
end
