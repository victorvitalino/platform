Entity::Engine.routes.draw do
  resources :cadastres, path: 'cadastros' do
    resources :members
    resources :inspections
  end
  resources :document_categories, path: 'categorias_documento'
  resources :member_jobs, path: 'diretoria_cargos'
  resources :reports, path: 'relatorios'

  resources :surveys, path: 'vistoria' do
    resources :inspections
  end
  
end
