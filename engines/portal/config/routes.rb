Portal::Engine.routes.draw do

	root 'home#index'

  resources :posts, path: 'postagem'
  resources :pages, path: 'pagina'
	resources :galleries, path: 'galeria'
	get 'noticias', to: 'noticias#index'
	get 'galerias', to: 'galleries#index'

	get 'galleries_private', to: 'galleries#galleries_private'
end
