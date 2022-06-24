Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :todolists

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :forums do
    resources :comments
  end

  get "search_forum", to: 'forums#search'

  resources :timetables 

  resources :categories

  resources :friendships, only: [:create, :destroy]

  # get 'chatrooms', to: 'chatrooms#index'
  resources :chatrooms do 
    resources :messages, only: [:create]
  end 

  # post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable' 
end
