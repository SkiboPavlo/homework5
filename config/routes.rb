Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :users
  resources :events do
    resources :comments, only: [:new, :create]
    post 'apply', on: :member
  end
end
