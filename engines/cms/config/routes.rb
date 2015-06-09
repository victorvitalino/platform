Cms::Engine.routes.draw do
  resources :page_categories
  resources :pages
  resources :post_categories
  resources :posts
end
