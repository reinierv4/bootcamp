Rails.application.routes.draw do
  
  get '/', to: 'users#welcome'

  post '/login', to: 'users#login'

  get '/users/overview', to: 'users#overview'

  resources :users, only: [:destroy, :show, :new, :create] do
    resources :products, only: [:destroy, :show, :index, :create, :new]
  end

  resources :products, only: [:index, :show] do
    resources :bids, only: [:create]
  end


end
