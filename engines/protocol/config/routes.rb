Protocol::Engine.routes.draw do

resources :assessments, path: 'autuacoes' do
  resources :digital_documents, path: 'digitalizacoes'
end

resources :document_types, path: 'tipo_documentos'
resources :subjects, path: 'assuntos'

resources :locations, path: 'localizacoes'

#get 'new_multiple', to: 'locations#new_multiple', as:'new_multiple'

get 'add_conduct/:assessment_id/alloment/:id', to: 'conducts#add', as: 'add'

get '/staffies/:sector_id', to: 'conducts#staffies', as: 'staffies'
get '/receive', to: 'conducts#receive', as: 'receive'

resources :allotments, path: 'remessas' do
  get 'send_conduct' , to: 'conducts#send_conduct', as: 'send'
  resources :conducts, path: 'movimentacoes'
end

end
