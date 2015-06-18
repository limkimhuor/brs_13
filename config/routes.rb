Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :users, only: [:index, :show]
  get "users/:id/:status", to: "relationships#index", as: :users_with_status
  resources :books, only: [:index, :show]
  resources :authors, only: [:show]
  resources :categories, only: [:show]
  devise_for :admins,
    class_name: "User",
    controllers: {sessions: "admins/sessions", only: [:create]},
    only: :sessions
  namespace :admins do
    root "users#index"
    devise_for :users
    resources :users
    resources :books
    resources :authors
    resources :categories
  end
  resources :relationships, only: [:index, :create, :destroy]
  resources :reviews
  resources :book_states, only: [:create, :update]
end
