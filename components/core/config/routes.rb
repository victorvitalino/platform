Core::Engine.routes.draw do

  resources :navs, path: 'menus' do
    resources :subnavs, path: 'submenus'
  end

end
