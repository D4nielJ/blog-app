Rails.application.routes.draw do
  root 'users#index'

  # resources :users, only: %i[index show] do
  #   resources :posts, only: %i[index show create]
  # end

  resources :users do
    resources :posts
  end

  get 'new', to: 'posts#new' # new post

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
