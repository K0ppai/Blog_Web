Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create]
    end
  end

  get '/sign_out', to: 'users#sign_out_session', as: 'sign_out'
end
