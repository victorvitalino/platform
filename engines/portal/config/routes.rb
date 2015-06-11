Portal::Engine.routes.draw do

	root 'home#index'
	
  resources :posts
  resources :pages
  
end
