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

  namespace :api, :defaults => {:format => 'json'} do
    namespace :v1 do
      resources :garages
      resources :garage_spots
      resources :bookings
    end
  end

  root "pages#show", page: "home"
  post "/next" => 'pages#next', :as => 'home_next'
end
