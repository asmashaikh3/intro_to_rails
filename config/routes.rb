Rails.application.routes.draw do
  get 'about/index'
  get 'about', to: 'static_pages#about'
  resources :books do
    resources :ratings, only: [:index, :new, :create, :destroy]
    resources :reviews, only: [:index, :new, :create, :destroy]
    resources :books, only: [:index, :show]
  end
  resources :users, only: [:index, :show, :new, :create]
  root "books#index"
end