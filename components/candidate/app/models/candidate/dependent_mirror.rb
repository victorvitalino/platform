module Candidate
  class DependentMirror < ActiveRecord::Base
    belongs_to :special_condition
    belongs_to :civil_state
    belongs_to :kinship
    belongs_to :special_condition
    belongs_to :cadastre_mirror

    enum gender: ['N/D', 'masculino', 'feminino']

    validates :name, :born, :kinship, :special_condition, presence: true 
    validates :cpf, :rg, presence: true, if: :major?
    validates_uniqueness_of :cpf, cpf: true, scope: :cadastre_mirror, if: :major?
    validates :percentage, presence: true, if: :co_acquirer?
    validates :income, presence:true, numericality: {only_float: true}

    def age
      return false unless self.born.present?
      (Date.today - self.born).to_i / 365
    end

    def special?
      (self.special_condition_id != 1) ? "Com Condição Especial" : "Sem Condição Especial"
    end
    
    private
    
    def co_acquirer?
      (self.co_acquirer)
    end

    def major?
      (age >= 18) if age
    end
  end
end
