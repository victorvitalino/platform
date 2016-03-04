Address::Engine.routes.draw do

  resources :units, path: 'unidades' do
    resources :notary_offices, path: 'cartorios'
  end
  resources :documents, path: 'documentos'
  get '/descriptive',        to: 'documents#descriptive',      as: 'descriptive'

  get '/city',        to: 'informations#cities',      as: 'cities'
  get '/blocks',      to: 'informations#blocks',      as: 'blocks'
  get '/groups',      to: 'informations#groups',      as: 'groups'
  get '/units',       to: 'informations#units',       as: 'all_units'
  get '/show_unit',   to: 'informations#show_unit',   as: 'show_unit'
end
