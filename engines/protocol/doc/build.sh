#!/bin/bash

rails $1 model subject name description:text status:boolean
rails $1 model document_type  name description:text status:boolean
rails $1 model conduct_type name description:text status:boolean
rails $1 model allotment description:text status:boolean user:references

rails $1 model assessment document_number external_number external_agency recipient_agency address cpf cnpj sign_by observation:text description_subject:text  document_type:references subject:references user:references setor:references

rails $1 model digital_document page_number:integer doc_path assessment:references user:references
rails $1 model conduct receipt_date:date term_response_date:date assessment:references sector_send:references  user_send:references sector_receptor:references user_receptor allotment:references
rails $1 model location shelf pile box obsevation:text assessment:references user:references