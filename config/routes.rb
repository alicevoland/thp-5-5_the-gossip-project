Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # Ressources
    resources :gossips do
      resources :comments
      resources :likes, only: %i[create destroy]
    end
    resources :users
    resources :cities, only: %i[show index]
    resources :sessions, only: %i[new create destroy]
  
    # Root
    get root 'gossips#index'
  
    # Landing page
    get 'welcome/:user_name', to: 'welcome#show', as: 'welcome'
  
    # Static pages
    get 'team', to: 'static_pages#team'
    get 'contact', to: 'static_pages#contact'
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
