Protocol::Engine.routes.draw do

resources :assessments, path: 'autuacoes'
resources :document_types, path: 'tipo_documento'
resources :subjects, path: 'assuntos'
end
