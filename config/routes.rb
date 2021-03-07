Rails.application.routes.draw do
  
  get "/reservations" => "reservations#index"
  get "reservations/new" => "reservations#new"
  post "reservations/create" => "reservations#create"
  get "reservations/:id" => "reservations#show"
  post "reservations/:id/destroy" => "reservations#destroy"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/destroy" => "users#destroy"
  
  get "sign_up" => "users#new" 
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
 
  get "search" => "rooms#search"
  get "rooms/new" => "rooms#new"
  post "rooms/create" => "rooms#create"
  get "rooms/:id" => "rooms#show"
  get "rooms/:id/edit" => "rooms#edit"
  post "rooms/:id/update" => "rooms#update"
  post "rooms/:id/destroy" => "rooms#destroy"
  
  get "/" => "home#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
