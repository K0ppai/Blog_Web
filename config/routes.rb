Rails.application.routes.draw do
  get 'likes/_new'
  root 'users#index'

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
