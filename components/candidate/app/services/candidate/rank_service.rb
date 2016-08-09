module Candidate
  class RankService
    
    # :quantity => valor total buscado para classificar 
    # [:rii, :rie, :special, :old, :vul] => porcentagem por lista que sera classificada
    # :situation_id   => situation para classificacao
    # :enterprise_id  => projeto parametro para classificacao
    # [:min_salary, :max_salary] => construção da faixa 

    attr_accessor :quantity, :rii, :rie, :special, :old, :vul, :situation_id,
                  :enterprise_id, :min_salary, :max_salary

    attr_accessor :general_list, :rii_list, :rii_older, :rii_special
    
    def initialize(options = {})
      @quantity       = options[:quantity]    ||= 0
      @min_salary     = options[:min_salary]  ||= 0
      @max_salary     = options[:max_salary]  ||= 1600.0

      @rii      = options[:rii]       ||= 40.0
      @rie      = options[:rie]       ||= 40.0
      @special  = options[:special]   ||= 8.0
      @old      = options[:old]       ||= 8.0
      @vul      = options[:vul]       ||= 4.0

      @enterprise_id  = options[:enterprise_id] ||= nil
    end

    def execute!
      @general_list = Candidate::IndicationQuery.new({enterprise_id: @enterprise_id, min_income: @min_salary, max_income: @max_salary})
      
      @rii_list     = @general_list.rii_with_zone.where('extract(year from age(born)) < 60 AND 
                                                       (special_condition_id not in (2,3,4) OR
                                                       (select COUNT(*) from candidate_dependents 
                                                       where special_condition_id not in (2,3)
                                                       and cadastre_id = general_pontuations.id) > 0)').order('total ASC')

      @rii_older    = @general_list.rii_with_zone.where('extract(year from age(born)) >= 60 AND 
                                                       (special_condition_id in (1, 4) OR
                                                       (select COUNT(*) from candidate_dependents 
                                                       where special_condition_id not in (2, 3)
                                                       and cadastre_id = general_pontuations.id) > 0)').order('total ASC')

      @rii_special  = @general_list.rii_with_zone.where('(special_condition_id in (2,3) OR
                                                       (select COUNT(*) from candidate_dependents 
                                                       where special_condition_id in (2,3)
                                                       and cadastre_id = general_pontuations.id) > 0)').order('total ASC')

    end

    private

    def values_valid?
      if (@rii + @rie + @special + @old + @vul) != 100.0
        raise ArgumentError, 'Porcentagens não resultam 100%'
      end

      if @quantity <= 0
        raise ArgumentError, 'Quantidade [:quantity] deverá ser maior que 0'
      end
    end


  end
end