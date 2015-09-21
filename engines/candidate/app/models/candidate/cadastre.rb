module Candidate
  class Cadastre < ActiveRecord::Base

    has_one :user_candidate, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user_candidate

    belongs_to :state, class_name: "Address::State"
    belongs_to :city, class_name: "Address::City"
    
    belongs_to :state_work, class_name: "Address::State"
    belongs_to :city_work, class_name: "Address::State"

    validates :cpf, presence:true, cpf: true, uniqueness: true

  end
end
