module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :state, class_name: "Address::State"
    belongs_to :subscribe
    
    has_many :observations
    has_many :candidate_participation
    has_many :attendances
    
    scope :by_concourse, -> (concourse) { joins(:subscribe).where('concourse_subscribes.project_id = ?', concourse)}
    scope :by_status, -> (status) { where(status: status)}
    scope :by_situation, -> (status) { where(status: status)}
    scope :by_cpf, -> (cpf) { where(cpf: cpf)}
    scope :by_id, -> (id) { where(id: id)}

    enum gender: [:masculino, :feminino]
    enum status: [:processando, :pendente, :homologado, :indeferido]

    serialize  :properties, Hash 

    def invoice_paid
        Brb::Invoice.where(category_id: self.subscribe.type_guide_id, cpf: self.cpf, status: 1).present?
    end

    def invoice_prints
        Brb::Invoice.where(category_id: self.subscribe.type_guide_id, cpf: self.cpf).count
    end
 end
end
