# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    member do
      patch :toggle_public
    end

    resources :recipe_foods, only: %i[new create destroy]
  end

  resources :foods
  # resources :users
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/users/shopping_list', to: 'users#shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#public_recipes'
end
