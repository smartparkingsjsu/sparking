Rails.application.routes.draw do
  resources :garage_spots
  resources :spots
  resources :garages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home" => "home#show"

  root "home#show", page: "home"
end
