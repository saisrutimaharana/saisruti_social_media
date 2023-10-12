Rails.application.routes.draw do
  get 'friendships/create'
  get 'likes/create'
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  
# config/routes.rb
  resources :posts do
    post 'like_post', to: 'likes#like', on: :member
    post 'dislike_post', to: 'likes#dislike', on: :member

    member do
      post 'follow'
      delete 'unfollow'
    end
  end
  resources :friendships, only: [:create, :destroy]
  root 'posts#index'
end
