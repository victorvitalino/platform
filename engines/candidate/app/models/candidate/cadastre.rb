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
    has_many :cadastre_checklists

    accepts_nested_attributes_for :dependents, allow_destroy: true

    scope :by_cpf, -> (cpf = nil) { where(cpf: cpf) }

    enum gender: ['N/D', 'masculino', 'feminino']

    validates :cpf, cpf: true
  end
end
