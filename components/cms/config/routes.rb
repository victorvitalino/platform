Cms::Engine.routes.draw do
  resources :galleries
  resources :navs
  resources :nav_categories
  resources :nav_categories
  resources :navs
  resources :page_categories
  resources :pages
  resources :post_categories
  resources :posts
  resources :videos
  resources :service_results
  get 'navsort', to: 'navs#sortable'
  post 'sortable', to: 'navs#sortable', as: 'sortable'
end
