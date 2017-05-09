Rails.application.routes.draw do
  resources :notifications
  resources :friend_requests
  resources :friends
  resources :likeits
  resources :shareds
  resources :publications
	resources :search
  devise_for :users, :controllers => { registrations: 'users/registrations' }
	match 'notifications/new/:id' => 'notifications#new', via: [:get], :as =>:user_message

	match 'search_persons' => 'search#persons', via: [:post], :as =>:search_persons
	#match 'search_persons' => 'search#persons', via: [:get], :as =>:search_persons
	get "/search_persons" => redirect("/")
	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :sign_out
  end
#map.root :controller => 'MyController', :action => :index 
root :to => redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
