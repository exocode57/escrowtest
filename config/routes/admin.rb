Rails.application.routes.draw do
  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      confirmations: 'admins/confirmations'
      }  
    devise_scope :admin do
        authenticated :admin do
            root 'admins/pages#home', as: :authenticated_admin_root
            end
        
            unauthenticated :admin do
            root 'pages#home', as: :unauthenticated_admin_root
            end        
      # Redirests signing out users back to sign-in
      # get "admins", to: "devise/sessions#new"
    end

    namespace :admins, as: :admin do
        get 'admins/pages/home'
        resources :stuffs
    end
end