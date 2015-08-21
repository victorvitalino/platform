module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :state, class_name: "Address::State"

    validates_presence_of :name, :state, :city, :cep, :address, :burgh, :number, :telephone
    validates :cpf, cpf: true, presence: true

    validates :telephone, numericality: true
    validates :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates :cnpj, cnpj: true, allow_blank: true
  end
end
