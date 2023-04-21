Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :new, :create, :destroy, :show ] do
    resources :posts, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:destroy]
end
