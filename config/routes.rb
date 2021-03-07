Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  root 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
    resource :participations, only: [:create, :destroy]
  end
end
