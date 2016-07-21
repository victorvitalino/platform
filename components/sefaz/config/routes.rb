Sefaz::Engine.routes.draw do

  resources :allotments, path: 'lotes' do
    get 'to_process'
    resources :exemptions, path: 'isencoes'
    resources :exemption_files
  end

end
