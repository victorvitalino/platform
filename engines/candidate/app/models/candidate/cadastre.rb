module Candidate
  class Cadastre < ActiveRecord::Base
    has_one :user_candidate, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user_candidate

    has_one :adjunct_cadastres
    accepts_nested_attributes_for :adjunct_cadastres


    validates :cpf, presence:true, cpf: true
  end
end
