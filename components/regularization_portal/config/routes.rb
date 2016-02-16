RegularizationPortal::Engine.routes.draw do
  root 'home#index'

  get   '/pesquisa-cpf',  to: 'cadastres#find_candidate', as: 'find_candidate'
  post  '/pesquisa-cpf',  to: 'cadastres#show_candidate', as: 'show_candidate'

  resources :lists, path: 'listas'
  resources :cadastres, path: 'cadastro'

  resources :requeriments, path: 'requerimentos' do 
    collection do 
      get   '/address', path: 'endereco', to: 'requeriments#new_address', as: 'new_address'
      post  '/address', path: 'endereco', to: 'requeriments#set_address', as: 'set_address'
      get   '/success', path: 'sucesso',  to: 'requeriments#success',     as: 'success'
    end
  end


  namespace :candidate, path: 'candidato' do 
    resources :requeriments,  path: 'requerimentos' do
      collection do 
        get '/verification',  path: 'verificacao', to: 'requeriments#verification', as: 'verification'
        post '/verification', path: 'verificacao', to: 'requeriments#validate_verification', as: 'validate_verification'
      end
    end

    resources :schedules, path: 'agendamentos' do
      collection do 
        get '/verification', path: 'verificacao', to: 'schedules#verification', as: 'verification'
      end
    end
  end

end
