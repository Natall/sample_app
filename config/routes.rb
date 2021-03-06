SampleApp::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :todos,         except: [:show] do
    put :delete_completed, on: :collection
    get :active, on: :collection
  end

  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/todos/completed', to: 'todos#completed', via: 'get'
  match '/todos/delete_completed', to: 'todos#delete_completed', via: 'get'

end