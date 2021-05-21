Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
    resource :participations, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :notifications, only: [:index] do
    collection do
      delete 'destroy_all'
    end
  end
end
