IndicationPortal::Engine.routes.draw do

  resources :enterprises, path: 'empreendimentos' do 
    collection do 
      get 'steps'
      get 'allotments'
    end
  end
end
