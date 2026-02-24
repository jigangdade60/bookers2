Rails.application.routes.draw do
 
    root "homes#top"

  get "home/about", to: "homes#about", as: :about

  get "session/new", to: "sessions#new", as: :new_session

  post "session/new", to: "sessions#create", as: :session
  
  delete "users/sign_out", to: "sessions#destroy", as: :destroy_session


  resources :users, only: [:new, :create, :index, :show, :edit, :update], path_names: { new: 'sign_up' }

  resources :books, only: [:index, :show, :create, :show, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]

  resources :books do
  resource :favorite, only: [:create, :destroy]
  end
  
  resources :passwords, param: :token

 

end