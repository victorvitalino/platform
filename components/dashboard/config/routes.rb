Dashboard::Engine.routes.draw do
	root 'home#index'
	resources :warnings
end
