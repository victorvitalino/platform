Attendance::Engine.routes.draw do
  root 'details#index'

  resources :details, only: [:index, :show] do 
    get 'resume',     path: 'resumo'
    get 'cancel',     path: 'cancelar'
    get 'continue',   path: 'continue'
  end

  namespace :basic do 
    resources :cadastres
  end

  namespace :enabled do
    resources :cadastre_mirrors do 
      get 'init'
      get 'continue'

      resources :dependent_mirrors
      resources :checklists
      resources :attendant_verifications
      resources :supervisor_verifications
    end
  end

  namespace :convoked do 
    resources :cadastre_mirrors
    resources :dependent_mirrors
    resources :checklists
    resources :attendant_verifications
    resources :supervisor_verifications
  end

  namespace :regularization do 
    resources :requeriments
    resources :cadastre_mirrors
    resources :dependent_mirrors
    resources :checklists
    resources :attendant_verifications
    resources :supervisor_verifications
  end
end
