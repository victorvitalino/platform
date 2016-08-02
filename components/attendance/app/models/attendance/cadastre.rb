module Attendance
  class Cadastre < ActiveRecord::Base

    belongs_to :type, foreign_key: "attendance_type_id"
    
    belongs_to :staff,      class_name: "Person::Staff"
    belongs_to :supervisor, class_name: "Person::Staff"
    belongs_to :cadastre,   class_name: "Candidate::Cadastre"

    enum status: ['pendente', 'finalizado', 'cancelado']
    
    enum attendance_type: [
                            'atualização_dados_de_contato',
                            'processo_de_habilitação',
                            'atualização_cadastral_de_habilitado'  
                          ]
  end
end
