Maintenance::Engine.routes.draw do
  resources :scripts do 
    collection do 
      get '/run/:command', to: 'scripts#run', as: 'run'
    end
  end
end
