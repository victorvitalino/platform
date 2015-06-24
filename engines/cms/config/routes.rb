Cms::Engine.routes.draw do
  resources :navs
  resources :nav_categories
  resources :nav_categories
  resources :navs
  resources :page_categories
  resources :pages
  resources :post_categories
  resources :posts
end
