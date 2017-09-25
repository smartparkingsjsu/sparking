Rails.application.routes.draw do
  resources :licenseplates
  resources :charges
  resources :events
  
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, controllers:  { registrations: 'registrations'}

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
  post "/next" => 'pages#next', :as => 'pages_next'
  post "/online_reservation" => 'pages#online_reservation', :as => 'pages_online_reservation'
end
