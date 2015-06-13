Rails.application.routes.draw do
  resources :haikus do
    member do
      post 'upvote'
    end
  end

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get '/about', to: 'static#show'

  get '/connect', to: 'static#new'

  get '/users', to: 'users#index'

  root :to => "haikus#index"
end

