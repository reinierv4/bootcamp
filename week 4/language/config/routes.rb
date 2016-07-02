Rails.application.routes.draw do
  
  root 'site#home'
  devise_for :admins
  get '/', to: 'site#home'
  get '/schools/admin/index', to: 'schools#admin_index'
  get '/school/delete/:id', to: 'schools#destroy',
   as: 'delete_school'

  resources :schools, only: [:show, :index, :create, :new, :edit, :update]

 

end
