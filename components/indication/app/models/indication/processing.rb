module Indication
  class Processing 
    include ActiveModel::Model

    attr_accessor :enterprise_id, :step_id, :zone_id
    attr_accessor :step
    attr_accessor :remnant_indications, :allotments_sum, :percent_total
    
    attr_accessor :rii, :rie, :vul, :special, :old, :demand, :target_demand, :total_demand
    attr_accessor :rii_percent, :rie_percent, :vul_percent, :special_percent, :old_percent, :total_percent
    attr_accessor :preview_step

    def initialize(options = {})
      @enterprise_id = options[:enterprise_id] ||= nil
      @step_id       = options[:step_id]       ||= nil
      @zone_id       = options[:zone_id]       ||= nil

      @rii     = options[:rii]      ||= ''
      @rie     = options[:rie]      ||= ''
      @vul     = options[:vul]      ||= ''
      @special = options[:special]  ||= ''
      @old     = options[:old]      ||= ''

      @rii_percent        = options[:rii_percent]      ||= 0
      @rie_percent        = options[:rie_percent]      ||= 0
      @old_percent        = options[:old_percent]      ||= 0
      @special_percent    = options[:special_percent]  ||= 0
      @vul_percent        = options[:vul_percent]      ||= 0

      @target_demand      = options[:target_demand]    ||= 0

    end

    def preview_demand
      if @target_demand.to_i == 0
        errors.add(:target_demand, "Demanda deverá ser maior que 0")  
      end

      if @target_demand.to_i > @remnant_indications.to_i
        errors.add(:target_demand, "Atenção: A demanda informada é maior que a quantidade restante da etapa")  
      end
      
      @rii_percent     = @rii.to_i.percent_of(@target_demand.to_i) 
      @rie_percent     = @rie.to_i.percent_of(@target_demand.to_i) 
      @vul_percent     = @vul.to_i.percent_of(@target_demand.to_i) 
      @old_percent     = @old.to_i.percent_of(@target_demand.to_i)
      @special_percent = @special.to_i.percent_of(@target_demand.to_i)
      
      @total_demand    = @rii.to_i + @rie.to_i + @vul.to_i + @old.to_i + @special.to_i
      @total_percent   = @total_demand.percent_of(@target_demand.to_i)
      
      errors.add(:total_percent, "Ainda não foi atingindo 100%") if @total_percent.to_i != 100
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

    def preview_cadastres
      service = Candidate::RankService.new({
        quantity: @total_demand,
        min_salary: by_zone.start_value,
        max_salary: by_zone.end_value,
        rii: @rii.to_i,
        rie: @rie.to_i,
        special: @special.to_i,
        old: @old.to_i,
        vul: @vul.to_i,
        enterprise_id: @step.enterprise_id
      })

      service.generate_rank!
    end

    def is_ok?
      @total_percent.to_i == 100
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

    def by_zone
      Candidate::Zone.find(@zone_id) rescue nil
    end
  end
end