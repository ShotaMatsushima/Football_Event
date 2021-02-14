Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  root 'users#index'
  resources :users, only: [:show]
  resources :events
end
