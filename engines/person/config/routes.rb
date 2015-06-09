Person::Engine.routes.draw do
  resources :jobs
  resources :systems
  resources :branch_lines
  resources :system_permissions
  resources :sectors
  resources :user_permissions
  resources :users

  get '/tree_data', to: 'user_permissions#tree_data'

end
