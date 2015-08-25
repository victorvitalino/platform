Finance::Engine.routes.draw do
  resources :type_slips
  resources :bank_slips do 
    get '/generate', path: 'emitir', as: 'generate', to: 'bank_slips#generate'
  end
end
