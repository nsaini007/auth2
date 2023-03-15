Rails.application.routes.draw do
  default_url_options :host => "localhost", :port => "3000"
  root 'static_pages#home'
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
