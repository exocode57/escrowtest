Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  draw :admin
  # root :to => "pages#home"
  
  resources :stuffs

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
