Rails.application.routes.draw do
  root 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'posts_of_user'
  get '/users/:user_id/posts/:id', to: 'posts#show'
end
