Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  post 'users/request_friendship'
  
  resources :users, only: [:index, :show, :request_friendship]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
