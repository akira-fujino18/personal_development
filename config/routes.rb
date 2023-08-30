Rails.application.routes.draw do
  root "users#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :categories, only: [:new, :create] do
      resources :skills, only: [:new, :create]
    end
  end

  resources :skills # 余分な行を削除します
end
