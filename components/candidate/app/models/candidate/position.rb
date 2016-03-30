module Candidate
  class Position < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :pontuation
    belongs_to :program

    def update_by_day(day)

      query = <<-SQL
        with before_day as (select *  from candidate_positions 
        where date_part('day',  created_at) = 21 and date_part('month',  created_at) = 03 and date_part('year',  created_at) = 2016)
        SELECT pos.id, pos.cadastre_id, pos.position, pos.zone, pos.program_id, bef.position position_before, bef.zone, bef.program_id
        FROM candidate_positions pos
        inner join before_day  bef
        on bef.cadastre_id = pos.cadastre_id and bef.program_id = pos.program_id
        where date_part('day',  pos.created_at) = 22 and date_part('month',  pos.created_at) = 03 and date_part('year',  pos.created_at) = 2016
        and pos.position <> bef.position
          order by pos.program_id, pos.position
      SQL

      

    end
  end
end
