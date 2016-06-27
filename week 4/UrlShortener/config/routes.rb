Rails.application.routes.draw do
  
 
    get '/', to: 'site#welcome'

    post '/construct_link', to: 'site#link_constructor'
      
    get'/:something', to: 'site#linkconverter'


end
