module Candidate
  class Cadastre < ActiveRecord::Base

    has_many :kins
    has_one :user_candidate, as: :account, dependent: :destroy

    accepts_nested_attributes_for :user_candidate


    validates :cpf, presence:true, cpf: true, uniqueness: true

  end
end
