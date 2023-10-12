Rails.application.routes.draw do
  get 'friendships/create'
  get 'likes/create'
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show] 

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  
# config/routes.rb
  resources :posts do
    post 'like_post', to: 'likes#like', on: :member
    post 'dislike_post', to: 'likes#dislike', on: :member

    member do
      post 'follow', to: 'users#follow'
      delete 'unfollow', to: 'users#unfollow'
    end
  end
  resources :posts do
    resources :comments, only: [:create, :destroy]

    resources :likes, only: [:create, :destroy]
    # get 'comments/:id', to: 'comments#show', on: :member, as: 'comment'
  end
  resources :friendships, only: [:create, :destroy]
  root 'posts#index'
end
