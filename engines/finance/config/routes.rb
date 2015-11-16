Finance::Engine.routes.draw do

  resources :type_guides,     path: 'guias_pagamento'
  resources :payment_guides,  path: 'emissoes'
  
  get 'generate_convenant', path: 'emitir_convenio', to: 'convenants#generate', as: 'generate_convenant'
  get 'generate_bankslip',  path: 'emitir_boleto',   to: 'bankslips#generate',  as: 'generate_bankslip'
end
