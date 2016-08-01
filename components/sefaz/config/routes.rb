Sefaz::Engine.routes.draw do

  resources :allotments, path: 'lotes' do
    get 'to_process'
    get 'send_exemption'
    get 'send_parcial_cancelation'
    get 'send_total_cancelation'
    resources :exemptions, path: 'isencoes'
    get 'new_parcial' , to: 'exemptions#new_parcial' , as: 'new_parcial'
    get 'new_total', to: 'exemptions#new_total', as: 'new_total'
    resources :exemption_files
  end

end
