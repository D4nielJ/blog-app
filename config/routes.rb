Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end

  get 'new', to: 'posts#new' # new post
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'api/users#create'

  # Very pretty -->
  # namespace :api, path: '', constraints: { subdomain: 'api' } do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
