Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, controllers:  { sessions: 'devise/sessions'}
  
  resources :garage_spots
  resources :spots
  resources :users

  resources :garages do
    resources :garage_spots do
      resources :bookings
    end
  end

  root "home#show", page: "home"
end
