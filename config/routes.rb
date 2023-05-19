Rails.application.routes.draw do
  devise_for :confirmables
  devise_for :users, views: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'likes/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
