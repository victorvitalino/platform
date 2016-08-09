module Candidate
  class RankService
    
    # :quantity => valor total buscado para classificar 
    # [:rii, :rie, :special, :old, :vul] => porcentagem por lista que sera classificada
    # :situation_id   => situation para classificacao
    # :enterprise_id  => projeto parametro para classificacao
    # [:min_salary, :max_salary] => construção da faixa 

    attr_accessor :quantity, :rii, :rie, :special, :old, :vul, :situation_id,
                  :enterprise_id, :min_salary, :max_salary

    attr_accessor :rii_list, :rie_list, :special_list, :old_list, :vul_list
    
    def initialize(options = {})
      @quantity       = options[:quantity]    ||= 0
      @min_salary     = options[:min_salary]  ||= 0
      @max_salary     = options[:max_salary]  ||= 1600.0

      @rii      = options[:rii]       ||= 40.0
      @rie      = options[:rie]       ||= 40.0
      @special  = options[:special]   ||= 8.0
      @old      = options[:old]       ||= 8.0
      @vul      = options[:vul]       ||= 4.0

      @situation_id   = options[:situation_id]  ||= nil
      @enterprise_id  = options[:enterprise_id] ||= nil
    end

    def ranking!
      values_valid?

    end

    def mount_lists
      @general  = Candidate::View::GeneralPontuation.where(income: @min_salary..@max_salary)
      @rii_list = @general.where(program_id: 1)
      @rie_list = @general.where(program_id: 2)
      @general.where(program_id: 2)

    end

    def list_old
      @object = general_pontuations
      @query  = "extract(year from age(born)) >= 60 
                AND convocation_id > 1524 
                AND procedural_status_id <> 14 
                AND income BETWEEN #{income_min} 
                AND #{income_max} and situation_status_id = 4"

      Candidate::View::GeneralPontuation.where(@query).order('total ASC')
    end

    def list_vul
      Candidate::View::GeneralPontuation.where(program_id: 4, situation_status_id: 4)
                                        .where('procedural_status_id <> 14')
                                        .order('total ASC')
    end

    private

    def general_pontuations
      @query = "situation_status_id = 4
                AND procedural_status_id <> 14"
      Candidate::View::GeneralPontuation.where(situation_status_id: 4)
                                        .where('procedural_status_id <> 14')
    end
    
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