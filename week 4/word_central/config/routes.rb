Rails.application.routes.draw do
  
  get '/', to: 'site#home'

  get '/text_inspections/new', to: 'text_inspections#new'

  post '/text_inspections', to: "text_inspections#create"

  get '/asciis/new', to: 'asciis#new' 

  post '/asciis', to: "asciis#create"

  get '/dummy_text/new', to: "dummy_text#new"

  post '/dummy_text', to: "dummy_text#create"


end
