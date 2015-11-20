Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :sessions, only: [:create, :new, :destroy]

  resources :bands, only: [:index, :show, :create, :new, :edit, :update]
  resources :albums, only: [:show, :create, :new]
end
