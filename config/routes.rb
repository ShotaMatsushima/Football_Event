Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  root 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
    resource :participations, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create]
  end
  resources :notifications, only: [:index] do
    collection do
      delete 'destroy_all'
    end
  end
end
