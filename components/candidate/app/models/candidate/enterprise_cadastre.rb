module Candidate
  class EnterpriseCadastre < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :enterprise, class_name: "Project::Enterprise"
    belongs_to :indication_cadastre, class_name: "Indication::Cadastre"
    has_many   :enterprise_cadastre_situations

    scope :prepare_allotment, -> (allotment_id) {
      cadastres = Indication::Cadastre.where(allotment_id: allotment_id).map(&:id) 
    }

    scope :prepare_step, -> (step_id) {
      allotments = Indication::Allotment.where(step_id: step_id).map(&:id)
      self.prepare_allotment(allotments) 
    }
    scope :by_enterprise, -> (enterprise_id = nil)  { where(enterprise_id: enterprise_id)}
    scope :by_allotment,  -> (allotment_id = nil)   { where(indication_cadastre_id: prepare_allotment(allotment_id))}    
    scope :by_step,       -> (step_id = nil)        { where(indication_cadastre_id: prepare_step(step_id))}
    scope :by_cpf,        -> (cpf = nil)            { joins(:cadastre).where('candidate_cadastres.cpf = ?', cpf)}

    scope :desactive, -> { where(inactive: true) }

    scope :contemplated, -> {
      self.joins('INNER JOIN general_pontuations AS point 
                  ON point.id = candidate_enterprise_cadastres.cadastre_id AND 
                  candidate_enterprise_cadastres.inactive IS NULL')
                  .where('point.situation_status_id IN(7,14)')
    }

    scope :in_process, -> {
      self.where(inactive: nil).joins('INNER JOIN general_pontuations AS point 
                  ON point.id = candidate_enterprise_cadastres.cadastre_id')
                .where('point.situation_status_id = 4')
    }
  end
end
