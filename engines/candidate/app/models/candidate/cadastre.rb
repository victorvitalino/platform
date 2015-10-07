module Candidate
  class Cadastre < ActiveRecord::Base
    belongs_to :special_condition
    belongs_to :city
    belongs_to :state
    belongs_to :work_city
    belongs_to :civil_state
    belongs_to :program

    validates :cpf, cpf: true
  end
end
