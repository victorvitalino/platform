RegularizationPortal::Engine.routes.draw do
  root 'home#index'

  resources :requeriments, path: 'requerimento' do 
    collection do 
      get '/address', path: 'endereco', to: 'requeriments#address'
    end
  end

  resources :schedules,    path: 'agendamento'

  namespace :candidate, path: 'candidato' do 
    resources :requeriments,  path: 'requerimentos'
    resources :schedules,     path: 'agendamentos'
  end
end
