ConcoursePortal::Engine.routes.draw do
  default_url_options :host => "localhost:3000" if Rails.env.development? || Rails.env.test?
  default_url_options :host => "www.codhab.df.gov.br"  if Rails.env.production?
  
  resources :projects, path: '/' do 

    resources :forget, path: 'lembrar' do 
      collection do 
        get 'senha', to: 'forgots#password', as: 'forget_password'
        get 'inscricao', to: 'forgots#subscribe', as: 'forget_subscribe'
      end
    end
    
    
    resources :pages,           path: '/pagina'
    resources :subscribes,      path: '/inscricoes' 
    resources :candidates,      path: '/candidato'
    resources :consults,        path: '/consultas'

    namespace :internal, path: 'interno' do 
      resources :candidates,      path: 'inscricao'
      resources :passwords,       path: 'senha'
      resources :participations,  path: 'participacao'
      resources :sessions,        path: 'acesso'
    end
  end


end

