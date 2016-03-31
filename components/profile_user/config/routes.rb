ProfileUser::Engine.routes.draw do
  #perfil
  get   'update', to: 'users#edit',   path: 'atualizar-perfil', as: 'edit_user'
  post  'update', to: 'users#update', path: 'atualizar-perfil', as: 'update_user'

  #senha
  get   'update_password', to: 'passwords#edit', path: 'atualizar-senha', as: 'edit_password'
  post  'update_password', to: 'passwords#update', path: 'atualizar-senha', as: 'update_password'
end
