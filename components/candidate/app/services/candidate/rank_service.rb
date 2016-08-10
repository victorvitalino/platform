module Candidate
  class RankService
    
    # :quantity => valor total buscado para classificar 
    # [:rii, :rie, :special, :old, :vul] => porcentagem por lista que sera classificada
    # :situation_id   => situation para classificacao
    # :enterprise_id  => projeto parametro para classificacao
    # [:min_salary, :max_salary] => construção da faixa 

    attr_accessor :quantity, :rii, :rie, :special, :old, :vul, :situation_id,
                  :enterprise_id, :min_salary, :max_salary

    attr_accessor :general_list, :rii_list, :rie_list, :rii_general, :rie_general, :old_list, :special_list, :vul_list
    
    def initialize(options = {})
      @quantity       = options[:quantity]    ||= 0
      @min_salary     = options[:min_salary]  ||= 0
      @max_salary     = options[:max_salary]  ||= 1600.0

      @rii      = options[:rii]       ||= 0
      @rie      = options[:rie]       ||= 0
      @special  = options[:special]   ||= 0
      @old      = options[:old]       ||= 0
      @vul      = options[:vul]       ||= 0

      @enterprise_id  = options[:enterprise_id] ||= nil
    end

    def generate_rank!
      @general_list = Candidate::IndicationQuery.new({enterprise_id: @enterprise_id, min_income: @min_salary, max_income: @max_salary})
      
      @rii_list     = @general_list.rii_with_zone.limit(rii_calc_demand)
      @rie_list     = @general_list.rie_with_zone.limit(rie_calc_demand)
      @vul_list     = @general_list.vul_with_zone.limit(@vul)
        
      @rii_general  = []
      @rie_general  = []
      @special_list = []
      @old_list     = []

      @rii_list.each do |candidate|

        if candidate.special_condition_id == 2 || candidate.special_dependent_count.to_i > 0
          if @special_list.count < @special
            @special_list << candidate
          end
        elsif ((Date.today - candidate.born).to_i / 365) >= 60
          if @old_list.count < @old
            @old_list << candidate
          end
        else 
          if @rii_general.count < @rii 
            @rii_general << candidate
          end
        end

      end      

      @rie_list.each do |candidate|

        if candidate.special_condition_id == 2 || candidate.special_dependent_count.to_i > 0
          if @special_list.count < @special * 2
            @special_list << candidate
          end
        elsif ((Date.today - candidate.born).to_i / 365) >= 60
          if @old_list.count < @old * 2
            @old_list << candidate
          end
        else 
          if @rie_general.count < @rie
            @rie_general << candidate
          end
        end

      end   

      @rii_general     = @rii_general.sort! { |a,b| b.total <=> a.total }
      @rie_general     = @rie_general.sort! { |a,b| b.total <=> a.total }
      
      @special_list = @special_list.sort! { |a,b| b.total <=> a.total }
      @special_list = @special_list[0..@special.to_i - 1]
      
      @old_list     = @old_list.sort! { |a,b| b.total <=> a.total }
      @old_list     = @old_list[0..@old.to_i - 1]
      
      @vul_list     = @vul_list

      {rii: @rii_general, rie: @rie_general, special: @special_list, old: @old_list, vul: @vul_list}
    end

    def rii_calc_demand
      (@rii + @special + @old) * 6
    end
    
    def rie_calc_demand
      (@rie + @special + @old) * 6
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