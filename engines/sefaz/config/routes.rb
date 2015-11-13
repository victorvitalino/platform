Sefaz::Engine.routes.draw do
  resources :transmissions do 
    get 'sign_document'
  end

  resources :iptu_consults
end
