Candidate::Engine.routes.draw do
  resources :inheritors, path: 'herdeiros', only: [:index, :show]
  resources :cadins

  resources :validations, path: 'validacoes'
  resources :occurrence_situations, path: 'situacoes_ocorrencia'

  resources :cadastres, path: 'cadastros' do
    resources :cadastre_occurrences
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

  resources :enterprise_cadastres do
    resources :enterprise_cadastre_situations
  end


end
