rails $1 model action_type name description:text

rails $1 model instance name description:text
rails $1 model local_instance name description:text instance:references

rails $1 model process_monitoring number_lawsuit number_administrative_process organ action_type:references value_cause local_instance:references part lawyer_responsible:references complemet:text status:boolean initial_date:date end_date:date process_type:integer

rails $1 model complemet document_type:references action_type:references local_instance:references date_distribution:date deadline:date days end_date:date complemet:text user:references status:boolean monitoring_type attachment