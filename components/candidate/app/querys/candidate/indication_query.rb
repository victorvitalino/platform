module Candidate
  class IndicationQuery

    attr_accessor :min_income, :max_income, :enterprise_id, :base_list

    def initialize(options = {})
      @min_income     = options[:min_income]    ||= 0
      @max_income     = options[:max_income]    ||= 0
      @enterprise_id  = options[:enterprise_id] ||= nil
      @program_id     = options[:program_id]    ||= nil
    end


    def rii_with_zone 
      base_list.where(program_id: 1).where(income: @min_income..@max_income).order('total DESC')
    end

    def rie_with_zone
      base_list.where(program_id: 2).where(income: @min_income..@max_income).order('total DESC')
    end

    def vul_with_zone
      base_list.where(program_id: 4).where(income: @min_income..@max_income).order('total DESC')
    end

   
    def base_list
      @enterprise_cadastres = Candidate::EnterpriseCadastre.select(:cadastre_id)
                                                           .where('enterprise_id = ? OR inactive IS NULL', @enterprise_id)
      
      @general = Candidate::View::GeneralPontuation.where(situation_status_id: 4, procedural_status_id: [14, 72])
                                                   .where.not(id:@enterprise_cadastres)

      @general.order('total DESC')

    end
  end
end