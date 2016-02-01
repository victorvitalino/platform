ConcoursePortal::Engine.routes.draw do
  default_url_options :host => "localhost:3000" if Rails.env.development? || Rails.env.test?
  default_url_options :host => "www.codhab.df.gov.br"  if Rails.env.production?
  
  resources :projects, path: '/' do 

    namespace :subscribe_candidate, path: 'inscricao' do 
      root "candidates#index"

      resources :candidates, path: 'candidato' do 
        get 'sucesso'
      end

      resources :remembers
    end

    namespace :restrict, path: 'restrito' do 
      root 'sessions#new'
      
      resources :candidates 
      resources :sessions
    end
    
    resources :pages,           path: '/pagina'
    resources :consults,        path: '/consultas'

  end


end

