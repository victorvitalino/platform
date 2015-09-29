Protocol::Engine.routes.draw do

resources :assessments, path: 'autuacoes' do
  resources :digital_documents, path: 'digitalizacoes'
  resources :attach_documents, path: 'anexos'
end

resources :document_types, path: 'tipo_documentos'
resources :subjects, path: 'assuntos'

resources :locations, path: 'localizacoes'

resources :reports, path: 'relatorios'

#get 'new_multiple', to: 'locations#new_multiple', as:'new_multiple'

get 'add_conduct/:assessment_id/alloment/:id', to: 'conducts#add', as: 'add'

get 'add_attach/:assessment_id/document_father/:id', to: 'attach_documents#add_attach', as: 'add_attach'

get 'add_append/:assessment_id/document_father/:id', to: 'attach_documents#add_append', as: 'add_append'

get '/staffies/:sector_id', to: 'conducts#staffies', as: 'staffies'
get '/receive', to: 'conducts#receive', as: 'receive'
get '/return', to: 'conducts#return', as: 'return'

get '/update_docs/:type', to: 'conducts#update_docs', as: 'update_docs'

resources :allotments, path: 'remessas' do
  get 'send_conduct' , to: 'conducts#send_conduct', as: 'send'
  resources :conducts, path: 'movimentacoes'
end

end
