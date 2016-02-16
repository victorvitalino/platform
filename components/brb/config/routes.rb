Brb::Engine.routes.draw do
  resources :categories
  resources :invoices
  resources :remittances
  resources :returns
end
