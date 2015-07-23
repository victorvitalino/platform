Protocol::Engine.routes.draw do

resources :assessments, path: 'autuacoes'

resources :document_types, path: 'tipo_documentos'
resources :subjects, path: 'assuntos'

get 'add_conduct/:assessment_id/alloment/:id', to: 'conducts#add', as: 'add'

resources :allotments, path: 'remessas' do
  get 'send_conduct' , to: 'conducts#send_conduct', as: 'send'
  resources :conducts, path: 'movimentacoes'
end

end
