module Indication
  class RankCreationService
    
    attr_accessor :rank, :allotment_id

    def self.create(*args)
      new(*args).create
    end

    def initialize(allotment)
      @allotment = allotment
    end

    def create!
      if @allotment.save
        @allotment_id = @allotment.id
        @allotment.rank[0].each do |item|
          item[1].each do |cadastre|
            @allotment.cadastres.new({
              cadastre_id:    cadastre.id,
              program_id:     cadastre.program_id,
              pontuation_id:  cadastre.pontuation_id,
              situation: 0,
              zone_id: @allotment.zone_id,
              source_list: item[0]
            }).save
          end
        end
      else 
        return false
      end
    end

    private

    def set_rank

    end
  end
end