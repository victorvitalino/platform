Address::Engine.routes.draw do

  get '/blocks',      to: 'informations#blocks',      as: 'blocks'
  get '/groups',      to: 'informations#groups',      as: 'groups'
  get '/units',       to: 'informations#units',       as: 'units'
  get '/show_unit',   to: 'informations#show_unit',   as: 'show_unit'
end
