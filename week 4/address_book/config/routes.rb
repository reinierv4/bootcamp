Rails.application.routes.draw do
  
  get '/contact/new', to: 'contacts#new'

  get '/contact/favourites', to: 'contacts#show_favourites'

  post '/contact', to: 'contacts#create'

  get '/contacts', to: 'contacts#index'

  get '/contact/:id', to: 'contacts#information'

  post '/favourite/:id', to: 'contacts#favourite'

  post '/search', to: 'contacts#filtered'

end
