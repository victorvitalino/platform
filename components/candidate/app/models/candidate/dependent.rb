module Candidate
  class Dependent < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :civil_state
    belongs_to :kinship
    belongs_to :special_condition
    belongs_to :rg_uf, class_name: "Address::State"

    enum gender: ['N/D', 'masculino', 'feminino']

    #validates :name, :cpf, :rg, :rg_org, :born, :gender, :place_birth,
            #  :civil_state, :income, :kinship, :special_condition, presence: true

  #  validates :cpf, cpf: true
  #  validates_date :born
  #  validates :percentage, numericality: true

  #  validates :income, numericality: {only_float: true}

    def self.count_updates(day)
      self.where(created_at: day).count
    end
  end
end
