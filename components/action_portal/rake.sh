rails g model profession name status:boolean
rails g model formation_area name status:boolean
rails g model atuation_area name status:boolean
rails g model social_event name date:date description:text situation:integer localization:references city:references
rails g model cadastre name cpf address nationality password email phone born:date city:references state:references
rails g model inscription sociel_event:references cadastre_references
