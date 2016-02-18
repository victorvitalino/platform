Archive::Engine.routes.draw do
  resources :files
  resources :images 

  post 'upload_file', to: 'images#upload_file', as: 'upload_file'
end
