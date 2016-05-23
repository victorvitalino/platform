module Candidate
  class Inheritor < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :inheritor_type
    belongs_to :civil_state

    scope :name_inheritor,  -> (name_inheritor) {where(name: name_inheritor)}
    scope :cpf,  -> (cpf) {where(cpf: cpf)}
    scope :type_inheritor,  -> (type_inheritor) {where(type_inheritor_id: type_inheritor)}

  end
end
