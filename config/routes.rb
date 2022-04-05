Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create ] do
      resources :comments, only: [:new, :create]
    end
  end

  get '/posts/new'
  put '/post/:id/like', to: 'posts#like', as: 'like'

  root "users#index"

end
