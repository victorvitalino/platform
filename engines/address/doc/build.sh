rails g model unit acron_block block acron_group group unit cep_unit area complete_address burgh sefaz:boolean donate:boolean date_donate:date date_iptu:date registration_iptu:date certificate situation_unit:references type_use_unit:references program:integer
rails g model situation_unit description status:boolean
rails g model type_use_unit description status:boolean
rails g model registry_unit situation:integer status:boolean unit:references   
rails g model notary_office unit_code office date_code:date date_contract:date code_contract office_contract:date date_petition:date date_signature:date date_anoreg:date date_devolution:date requeriment date_requeriment:date declaratory_act_number rejection_number unit:references date_act_requeriment:date date_act_rejection:date 