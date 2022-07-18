Rails.application.routes.draw do
  resources :payments
  get 'pages/home'
  get 'pages/about'
  draw :admin
  # root :to => "pages#home"
  
  resources :stuffs do
    resources :payments
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
