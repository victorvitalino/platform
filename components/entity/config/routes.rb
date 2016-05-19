Entity::Engine.routes.draw do
  resources :cadastres, path: 'cadastros' do 
    resources :members
  end
  resources :document_categories, path: 'categorias_documento'
  resources :member_jobs, path: 'diretoria_cargos'
end
