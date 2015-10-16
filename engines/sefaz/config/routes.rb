Sefaz::Engine.routes.draw do
  resources :transmissions do 
    get 'sign_document'
  end
end
