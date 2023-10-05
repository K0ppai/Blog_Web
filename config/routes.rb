Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: %i[index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end

  get "/sign_out", to: "users#sign_out_session", as: "sign_out"
end
