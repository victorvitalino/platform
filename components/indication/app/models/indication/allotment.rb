module Indication
  class Allotment < ActiveRecord::Base
    belongs_to :step, -> { order(:id) }, class_name: "Project::Step"
    belongs_to :zone, class_name: "Candidate::Zone"

    has_many :cadastres, dependent: :destroy

    attr_accessor :rii_percent, :rie_percent, :special_percent,
                  :vulnerable_percent, :old_percent, :total_percent,
                  :total, :rank

    #validates :enterprise, :zone, :code, presence: true
    validates :demand, :rii, :rie, :old, :special, :vulnerable, presence: true, numericality: true


    validate  :percent_of_attributes
    validate  :generate_rank

    def created_at_formated
      self.created_at.strftime('%d/%m/%Y')
    end

    def situation
      self.status ? "Processada" : "Não processada"
    end

    private

    def percent_of_attributes
      self.rii_percent        = self.rii.to_i.percent_of(self.demand)
      self.rie_percent        = self.rie.to_i.percent_of(self.demand)
      self.old_percent        = self.old.to_i.percent_of(self.demand)
      self.special_percent    = self.special.to_i.percent_of(self.demand)
      self.vulnerable_percent = self.vulnerable.to_i.percent_of(self.demand)
      
      self.total = self.rii.to_i + self.rie.to_i + self.old.to_i + self.special.to_i + self.vulnerable.to_i 
      self.total_percent  = self.total.to_i.percent_of(self.demand) 
      
      if self.total.to_i != self.demand.to_i
        errors.add(:total, "deverá ser igual o valor da demanda informado")
      end

      if self.total_percent.to_i < 100
        errors.add(:total_percent, "deverá resultar em 100.0%")
      end
    end

    def generate_rank
      self.rank = Candidate::RankService.new({
        quantity: self.demand,
        min_salary: self.zone.start_value,
        max_salary: self.zone.end_value,
        rii: self.rii.to_i,
        rie: self.rie.to_i,
        special: self.special.to_i,
        old: self.old.to_i,
        vul: self.vulnerable.to_i,
        enterprise_id: self.step.enterprise_id
      }).generate

      # => return
      # {rii: @rii_general, rie: @rie_general, special: @special_list, old: @old_list, vul: @vul_list}
      self.rank[0].each do |item|
        if self.send("#{item[0]}".to_sym).to_i != item[1].count
          errors.add("#{item[0]}".to_sym, "valor não encontrado")
        end
      end

    end
  end
end
