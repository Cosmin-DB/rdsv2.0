Rails.application.routes.draw do
  resources :images
  get 'users/index'

  #resources :likes
  #resources :shares
  resources :notifications
  resources :friend_requests
  resources :friends
  resources :likeits
  resources :shareds
  resources :publications
	resources :search

    
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/users/delete/:id' => 'users#destroy', via: [:delete], :as =>:destroy_user
	match 'notifications/new/:type/:id' => 'notifications#new', via: [:get], :as =>:user_message
  match 'friends/:user_id/:friend_id' => 'friends#create', via: [:post], :as =>:create_friend
  match 'friends/:user_id/:friend_id' => 'friends#destroy', via: [:delete], :as =>:destroy_friend
    
	match 'shares/:id' => 'shares#share', via: [:post], :as =>:share
	match 'unshares/:id' => 'shares#unshare', via: [:post], :as =>:unshare
	match 'likes/:id' => 'likes#like', via: [:post], :as =>:like
	match 'dislikes/:id' => 'likes#dislike', via: [:post], :as =>:dislike
    
	match 'search_persons' => 'search#persons', via: [:get], :as =>:search_persons
	get "/search_persons" => redirect("/")
	
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get '/register', to: 'devise/registrations#new',as: :new_registration
  end

#map.root :controller => 'MyController', :action => :index 
root :to => redirect('/publications')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
