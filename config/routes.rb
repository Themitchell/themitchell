Rails.application.routes.draw do

  devise_for :user
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :creative_works, only: [:index, :show], path: 'creative-works'
  resources :cv, only: :index
  resources :posts, only: [:index, :show]

  root to: 'posts#index'
end
