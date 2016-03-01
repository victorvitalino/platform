Api::Engine.routes.draw do

  namespace :protocol, path: 'protocolo' do
    resources :assessments,   path: 'processo', only: :index
    resources :document_types, path: 'documento_tipos', only: :index

  end

  namespace :regularization, path: 'regularizacao' do
    resources :lists, path: 'lista', only: :index
  end

end
