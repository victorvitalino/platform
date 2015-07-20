Protocol::Engine.routes.draw do

resources :assessments, path: 'autuacoes'

resources :document_types, path: 'tipo_documentos'
resources :conduct_types, path: 'tipo_movimentacoes'
resources :subjects, path: 'assuntos'
resources :allotments, path: 'remessas' do
  resources :conducts, path: 'movimentacoes'
end

end
