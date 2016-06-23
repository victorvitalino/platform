Portal::Engine.routes.draw do

	root 'home#index'

  resources :posts, path: 'postagem'
  resources :pages, path: 'pagina'
	resources :galleries, path: 'galeria'
	get 'noticias', to: 'noticias#index'
	get 'galerias', to: 'galleries#index'

	get 'galerias_privadas', to: 'galleries#galleries_private'
	get 'habitabrasilia', to: 'habita#index'
	get 'habitabrasilia_teste', to: 'habita_teste#index'
end
