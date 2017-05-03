Rails.application.routes.draw do
  resources :notifications
  resources :friend_requests
  resources :friends
  resources :likeits
  resources :shareds
  resources :publications
  devise_for :users, :controllers => { registrations: 'users/registrations' }
	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :sign_out
  end
#map.root :controller => 'MyController', :action => :index 
root :to => redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
