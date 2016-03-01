Candidate::Engine.routes.draw do
  resources :cadins
  resources :cadastres, path: 'cadastros' do
    get   'cadastre_situation/id', path: 'situacao', to: 'cadastres#cadastre_situation', as: 'cadastre_situation'
    post  'cadastre_situation_create', path: 'criar_situacao', to: 'cadastres#cadastre_situation_create', as: 'cadastre_situation_create'

    get   'cadastre_procedural/id', path: 'situacao_processual', to: 'cadastres#cadastre_procedural', as: 'cadastre_procedural'
    post  'cadastre_procedural_create', path: 'criar_situacao_processual', to: 'cadastres#cadastre_procedural_create', as: 'cadastre_procedural_create'

  end
  resources :cadastre_addresses, path: 'enderecos'
  resources :lists
  resources :checklists



end
