Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  
  resources :users
  resources :movies do
  	collection do
  		get 'search'
  	end
    resources :comments
  end
  
  root 'movies#index'
end
