module Candidate
  class Cadastre < ActiveRecord::Base

    belongs_to :special_condition
    belongs_to :city
    belongs_to :state
    belongs_to :work_city
    belongs_to :civil_state
    belongs_to :program
    belongs_to :city, class_name: "Address::City"
    belongs_to :work_city, class_name: "Address::City"

    has_many :dependents
    has_many :cadastre_situations
    has_many :attendances
    has_many :pontuations

    has_many :enterprise_cadastre, class_name: "Firm::EnterpriseCadastre"

    has_many :cadastre_checklists
    has_many :firm_enterprise_statuses, class_name: 'Firm::EnterpriseStatus'
    has_many :enterprise_cadastres, class_name: "Firm::EnterpriseCadastre"


    accepts_nested_attributes_for :dependents, allow_destroy: true

    scope :by_cpf, -> (cpf = nil) { where(cpf: cpf) }

    enum gender: ['N/D', 'masculino', 'feminino']

    validates :cpf, cpf: true


    def current_situation_id
       cadastre_situations.last.situation_status_id
    end

    def current_situation_name
       cadastre_situations.last.situation_status.name.upcase
    end

  
  end
end
