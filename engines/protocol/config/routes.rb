Protocol::Engine.routes.draw do

resources :assessments, path: 'autuacoes'
resources :document_types, path: 'tipo_documento'
resources :conduct_types, path: 'tipo_movimentacao'
resources :subjects, path: 'assuntos'

end
