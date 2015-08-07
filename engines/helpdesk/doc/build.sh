rails g scaffold status name
rails g scaffold category name status:boolean
rails g scaffold order_service prefix number:integer opened_by required_by sector:references branch_line:references user:references good:references status:references category:references
rails g scaffold qualification name status:boolean order_service:references
rails g scaffold monitor_service_order appointment:text attachment status:boolean order_service:references
rails g scaffold attendant type_attendant  code staff:references