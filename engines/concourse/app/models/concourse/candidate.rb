module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :state, class_name: "Address::State"

    validates_presence_of :name, :terms_use, :state, :city, :cep, :address, :burgh, :number, :telephone

    validates :cpf, cpf: true, presence: true

    validates :telephone, numericality: true
    validates :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates :cnpj, cnpj: true, presence: true, if: :juridical_person?
    
    private

    def juridical_person?
      self.fantasy_name.present?
    end
  end
end
