Portal::Engine.routes.draw do

	root 'home#index'
	
  resources :posts, path: 'postagem'
  resources :pages, path: 'pagina'
  
end
