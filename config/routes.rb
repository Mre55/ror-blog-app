Rails.application.routes.draw do

  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create ] do
      resources :comments, only: [:new, :create]
    end
  end

  get '/posts/new', to: 'posts#new'
  post 'likes/:post_id', to: 'likes#create', as: 'like'

end
