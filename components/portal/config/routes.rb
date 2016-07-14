Portal::Engine.routes.draw do

	root 'home#index'

  resources :posts, path: 'postagem'
  resources :pages, path: 'pagina'
	resources :galleries, path: 'galeria'
	
  get '/assistenciatecnica' => redirect('/pagina/31')

  get 'noticias', to: 'noticias#index'
	get 'galerias', to: 'galleries#index'
	get 'selagem', to: 'sealings#index'

	get 'galerias_privadas', to: 'galleries#galleries_private'
	get 'habitabrasilia', to: 'habita#index'

  get 'map_test', to: 'map#test'
end
