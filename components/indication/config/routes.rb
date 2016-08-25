Indication::Engine.routes.draw do

  resources :cadastres,  path: 'indicados'
  resources :enterprises, path: 'empreendimentos' do
    resources :steps, path: 'etapas' do
      resources :allotments, path: 'lotes' do
        collection do
          get 'execute'
        end
      end
    end
  end
  resources :reports, path: 'relatorios'
end
