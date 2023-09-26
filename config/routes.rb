Rails.application.routes.draw do
  root 'users#index'
  resources :users
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
end
