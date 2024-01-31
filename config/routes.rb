# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'posts#index'

  # Defines the routes for the posts resource, create:
  #  GET /posts          => posts#index   (lists all posts)
  #  GET /post/:id      => posts#show    (shows a specific post)
  #  GET /posts/new      => posts#new     (returns an HTML form for creating a new post)
  #  POST /posts         => posts#create  (gets the params from posts#new and call the model to create a new post)
  #  GET /posts/:id/edit => posts#edit   (returns an HTML form for editing a post)
  #  PATCH /posts/:id    => posts#update  (gets the params from posts#edit and call the model to update a post)
  #  DELETE /posts/:id   => posts#destroy (deletes a specific post)
  get '/posts/category/:id' => 'posts#category', as: 'category_posts'
  resources :posts

  # Defines the routes for the users resource, create:
  # get '/users/:id' => 'users#show', as: 'user'
  get '/users/new' => 'users#new', as: 'logup'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  # Defines the routes for the sessions resource, create:
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'
end
