module Candidate
  module View
    class GeneralPontuation < ActiveRecord::Base
      self.table_name = 'general_pontuations'

      
      scope :by_income, -> (started_at = 0, ended_at = 1600) { where(income: started_at..ended_at) }
      scope :cpf, -> (cpf) {where(cpf: cpf)}
      scope :by_name, -> (name) {where("name ILIKE '%#{name}%' ")}

      def self.paginate
        self
      end

      def cadastre
        Candidate::Cadastre.find(self.id) rescue nil
      end


      def self.is_olders?(date)
        age = date - 60.years
        self.where(born: age, situation_status_id: 4).count
      end

    end
  end
end
