Candidate::Engine.routes.draw do
  resources :inheritors, path: 'herdeiros', only: [:index, :show]
  resources :cadins

  resources :cadastres, path: 'cadastros' do
    get   'cadastre_situation/id', path: 'situacao', to: 'cadastres#cadastre_situation', as: 'cadastre_situation'
    post  'cadastre_situation_create', path: 'criar_situacao', to: 'cadastres#cadastre_situation_create', as: 'cadastre_situation_create'

    get   'cadastre_procedural/id', path: 'situacao_processual', to: 'cadastres#cadastre_procedural', as: 'cadastre_procedural'
    post  'cadastre_procedural_create', path: 'criar_situacao_processual', to: 'cadastres#cadastre_procedural_create', as: 'cadastre_procedural_create'
    resources :inheritors, path: 'herdeiros', only: [:new, :edit, :destroy]
  end

  resources :cadastre_addresses, path: 'enderecos'

  get   'unallocate/id', path: 'desassenta', to: 'cadastre_addresses#unallocate', as: 'unallocate'
  post  'deallocate', path: 'desassentar', to: 'cadastre_addresses#deallocate', as: 'deallocate'
  get   'transfer/id', path: 'transferencia', to: 'cadastre_addresses#transfer', as: 'transfer'

  resources :lists
  resources :checklists
  resources :checklist_types
  resources :verifications
  resources :enterprise_situation_statuses, path: 'situacao_empresas'
  resources :reports, path: 'relatorios'


  resources :ocurrences, path: 'ocorrencias' do 
    collection do 
      get   'new/:cpf',     to: 'ocurrences#new'
      post  ':cpf',         to: 'ocurrences#create'

      get   'edit/:id',     to: 'ocurrences#edit'
      put   ':id',          to: 'ocurrences#update'

      post  'search',       to: 'ocurrences#search', as: 'search'
      get   'detail/:cpf',  to: 'ocurrences#detail', as: 'detail'
    end
  end


end
