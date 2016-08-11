module Indication
  class Cadastre < ActiveRecord::Base
    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :pontuation, class_name: "Candidate::Pontuation"
    belongs_to :allotment
    belongs_to :zone, class_name: "Candidate::Zone"
    
    has_many :enterprise_cadastres, foreign_key: 'indication_cadastre_id', class_name: "Candidate::EnterpriseCadastre"
    
    scope :prepare_enterprise, -> (enterprise_id) {
      enterprise = Project::Enterprise.find(enterprise_id) rescue nil
      enterprise.present? ? enterprise.allotments.map(&:id) : nil
    }

    scope :by_allotment,  -> (alloment_id)    { where(allotment_id: alloment_id)}    
    scope :by_enterprise, -> (enterprise_id)  { where(allotment_id: self.prepare_enterprise(enterprise_id))}
    scope :by_step,       -> (step_id = nil)        { where(allotment_id: Indication::Allotment.where(step_id: step_id))}
  end
end
