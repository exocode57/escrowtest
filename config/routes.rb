Rails.application.routes.draw do
  get 'redirectpage/statuspayment'
  resources :payments
  get 'pages/home'
  get 'pages/about'
  draw :admin
  # root :to => "pages#home"
  
  resources :stuffs do
    resources :payments
  end

  resources :redirectpage do
    collection do
      post :statuspayment
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
