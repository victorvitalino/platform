Juridical::Engine.routes.draw do

   resources :legal_advices, path: 'acompanhamentos'  do
     resources :complements, path: 'complementos'
   end
   get '/instancy_places',        to: 'instancies#instancy_places',      as: 'instancy_places'
   resources :housing_programs, path: 'programas'
   resources :lawsuits, path: 'tipo_acoes'
   resources :advice_types, path: 'tipo_acompanhamentos'
   resources :instancies, path: 'instancias' do
     resources :instancy_places, path: 'local_instancias'
   end

end
