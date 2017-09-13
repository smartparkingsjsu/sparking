Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  
  resources :garage_spots
  resources :spots
  resources :garages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#show", page: "home"
end
