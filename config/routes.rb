Rails.application.routes.draw do
  
  root 'pages#show', page: 'home'
  mount ActionCable.server, at: '/cable'

  resources :licenseplates
  resources :charges
  
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register", :confirmation => "resend" }, controllers:  { sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :garage_spots
  resources :spots
  resources :users

  resources :garages do
    get '/dashboard' => 'pages#dashboard', :as => 'pages_dashboard'
    get '/search' => 'garages#search', :as => 'garages_search'
    post '/check/in/success' => 'garages#in_success', :as => 'garages_in_success'
    get '/check/out' => 'garages#out', :as => 'garages_out'
    post '/check/out/success' => 'garages#out_success', :as => 'garages_out_success'
    post '/retrieve' => 'garages#retrieve', :as => 'garages_retrieve'
    post '/retrieve/charged' => 'garages#charged', :as => 'garages_charged'

    resources :garage_spots do
      resources :bookings
    end
    resources :charges
  end

  namespace :api, :defaults => {:format => 'json'} do
    namespace :v1 do
      resources :garages
      resources :garage_spots
      resources :bookings
      resources :triggers
      resources :dashboards
      resources :notifications

      match '/calculate' => 'applications#calculate', via: :get
    end
  end

  post '/confirmed' => 'reservations#garage_reservation', :as => 'reservations_garage_reservation'
  post '/reserved' => 'reservations#online_reservation', :as => 'reservations_online_reservation'
end