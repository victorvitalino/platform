module Project
  class Step < ActiveRecord::Base
    belongs_to :enterprise

    has_many :allotments, class_name: "Indication::Allotment"

    validates :name, presence: true
    validates :demand, :rii, :rie, :old, :special, :vulnerable, numericality:  true, presence: true


    def residual_count
      (self.demand - self.allotments.sum(:demand))
    end

    def total_demand_count
      self.allotments.sum(:demand)
    end    

    def detail_lists
      rii = self.allotments.sum(:rii)
      rie = self.allotments.sum(:rie)
      old = self.allotments.sum(:old)
      special    = self.allotments.sum(:special)
      vulnerable = self.allotments.sum(:vulnerable)
      
      total = rii + rie + old + special + vulnerable
      
      [{
        rii: rii, rii_percent: rii.percent_of(self.demand),
        rie: rie, rie_percent: rie.percent_of(self.demand),
        old: old, old_percent: old.percent_of(self.demand),
        special: special, special_percent: special.percent_of(self.demand),
        vulnerable: vulnerable, vulnerable_percent: vulnerable.percent_of(self.demand),
        total: total, total_percent: total.percent_of(self.demand)
      }]
    end
  end
end
