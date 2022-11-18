Rails.application.routes.draw do
  resources :posts
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:create, :destroy, :new]
  resources :subs, except: [:destroy]

end
