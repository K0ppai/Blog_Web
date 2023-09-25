Rails.application.routes.draw do
  root 'users#index'
  
  get "/users/:id", to: "users#show"
  get '/users/:user_id/posts', to: 'posts#index'
end
