Rails.application.routes.draw do

  resources :reservations  

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/destroy" => "users#destroy"

  resources :users

  get "search" => "rooms#search"
  resources :rooms

  get "/" => "home#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
