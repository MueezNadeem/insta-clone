Rails.application.routes.draw do

  resources :stories
  resources :likes, only: [:create,:destroy]

  resources :comments
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }

  resources :users, only: [:show]

  post 'users/:id/follow', to: "users#follow", as: "follow"
  post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow"
  post 'users/:id/accept', to: "users#accept", as: "accept"
  post 'users/:id/decline', to: "users#decline", as: "decline"
  post 'users/:id/cancel', to: "users#cancel", as: "cancel"

  get 'search', to:"users#search"
  get 'home/about'
  get 'posts/myposts'
  get 'stories/mystories'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
end
