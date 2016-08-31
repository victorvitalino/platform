Geo::Engine.routes.draw do
  root 'entities#index'

  resources :entities, path: 'entidades' do 

    collection do 
      get 'entities_2016', path: '2016'
      get 'situation_entity', path: 'situacao_nova'
    end
  end



end
