Indication::Engine.routes.draw do

  resources :cadastres,  path: 'indicados'
  resources :enterprises, path: 'empreendimentos' do
    resources :steps, path: 'etapas' do
      resources :allotments, path: 'lotes'
    end
  end

  resources :processings, path: 'processamento' do 
    collection do 
      post 'preview_demand', to: 'processings#preview_demand'
    end
  end
end
