rails g scaffold status name
rails g scaffold order_service prefix number:integer opened_by required_by sector:references branch_line:references user:references good:references status:references
rails g scaffold qualification name status:boolean order_service:references
<<<<<<< HEAD
rails g scaffold monitor_service_order appointment:text attachment name status:boolean order_service:references
=======
rails g scaffold monitor_service_order appointment:text attachment status:boolean order_service:references
>>>>>>> 9f728d222a8f5cb9ef767f14977384bf25569161
