# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
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
  resources :posts
  get '/posts/category/:id' => 'posts#category', as: 'category_posts'
end
