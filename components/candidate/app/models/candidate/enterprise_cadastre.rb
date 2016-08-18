module Candidate
  class EnterpriseCadastre < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :enterprise, class_name: "Project::Enterprise"
    belongs_to :indication_cadastre, class_name: "Indication::Cadastre"
    has_many :enterprise_cadastre_situations, class_name: "Candidate::EnterpriseCadastreSituation"

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

    scope :name_candidate,  -> (name) {joins(:cadastre).where('candidate_cadastres.name like ?', "#{name}%")}
    scope :status, -> (status) { where(status: status) }

    scope :desactive, -> { where(inactive: true) }

    scope :contemplated, -> (enterprise_id = nil){
      self.joins('INNER JOIN general_pontuations AS point
                   ON point.id = candidate_enterprise_cadastres.cadastre_id
                   inner join candidate_cadastre_addresses
                   on candidate_cadastre_addresses.cadastre_id = candidate_enterprise_cadastres.cadastre_id
                   inner join address_units as unit
                   on unit.id = candidate_cadastre_addresses.unit_id')
                   .where('point.situation_status_id IN(7,14) and candidate_cadastre_addresses.situation_id = 1
                   and unit.situation_unit_id = 3 and unit.project_enterprise_id = ?', enterprise_id)
    }

    #scope :contemplated, -> (enterprise_id = nil){
    #  Candidate::View::IndicatedContemplated.where('situation_status_id in (7,14)
    #                                                AND situation_id = 1 AND situation_unit_id = 3
    #                                                and project_enterprise_id = ?', enterprise_id)

  #  }



    scope :in_process, -> {
      self.where(inactive: nil).joins('INNER JOIN general_pontuations AS point
                  ON point.id = candidate_enterprise_cadastres.cadastre_id')
                .where('point.situation_status_id = 4')
    }
  end
end
