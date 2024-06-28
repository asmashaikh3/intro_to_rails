Rails.application.routes.draw do
  resources :books do
    resources :ratings, only: [:new, :create, :index]
    resources :reviews, only: [:new, :create, :index]
  end
  resources :users, only: [:index, :show, :new, :create]
  root "books#index"
end
