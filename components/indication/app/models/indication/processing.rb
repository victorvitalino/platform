module Indication
  class Processing 
    include ActiveModel::Model

    attr_accessor :enterprise_id, :step_id, :zone_id
    attr_accessor :remnant_indications, :allotments_sum, :percent_total
    attr_accessor :rii, :rie, :vul, :special, :old, :demand, :target_demand

    attr_accessor :preview_step

    def initialize(options = {})
      @enterprise_id = options[:enterprise_id] ||= nil
      @step_id       = options[:step_id]       ||= nil
      @zone_id       = options[:zone_id]       ||= nil

      @rii     = options[:rii]      ||= 0
      @rie     = options[:rie]      ||= 0
      @old     = options[:vul]      ||= 0
      @special = options[:old]      ||= 0
      @vul     = options[:special]  ||= 0
    end

    def preview_demand
      total = @rii.to_i + @rie.to_i + @vul.to_i + @old.to_i + @special.to_i
      errors.add(:percent_total, "O total não pode exceder 100%") if total > 100
    end

    def load_step_data
      @step = Project::Step.find(@step_id) rescue nil
      
      return nil if @step.nil?
      @allotments_sum = @step.allotments.sum(:demand) rescue 0
      @remnant_indications = @step.demand - @step.allotments.sum(:demand)
      
      @preview_step = {
        enterprise_title: @step.enterprise.name,
        step: @step,
        alloment_indications: @allotments_sum, 
        remnant_indications: @remnant_indications,
        step_name:  @step.name,
        step_demand: @step.demand,
        programs: {
          rii: @step.allotments.sum(:rii),
          rie: @step.allotments.sum(:rie),
          vul: @step.allotments.sum(:vulnerable),
          special: @step.allotments.sum(:special),
          old: @step.allotments.sum(:old),
        }
      }

    end

    def enterprise
      Project::Enterprise.actives.order(:name)
    end

    def step(id)
      Project::Step.where(enterprise_id: id)
    end

    def zone
      Candidate::Zone.all.order(:code)
    end
  end
end