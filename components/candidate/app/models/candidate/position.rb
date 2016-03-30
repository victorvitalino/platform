module Candidate
  class Position < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :pontuation
    belongs_to :program

    scope :update_by_day, -> (day, zone, program, page = 1, per_page = 20) {
      current_date  = Date.parse(day)
      last_date     = current_date - 1.day 

      current_date_formated = current_date.strftime('%d/%m/%Y').split('/')
      last_date_formated    = last_date.strftime('%d/%m/%Y').split('/')

      current_day   = current_date_formated[0]
      last_day      = last_date_formated[0]
      
      month = current_date_formated[1]
      year  = current_date_formated[2]

      query = <<-SQL
        WITH before_day as (SELECT *  FROM candidate_positions WHERE date_part('day',  created_at) = #{last_day} 
        AND date_part('month',  created_at) = #{month} 
        AND date_part('year',  created_at) = #{year} )
        SELECT pos.id, pos.cadastre_id, pos.position, pos.zone, prog.name AS current_program, bef.position AS position_before,
        bef.zone, prog_old.name AS old_program, pos.created_at
        FROM candidate_positions AS pos 
        INNER JOIN before_day AS bef
        ON bef.cadastre_id = pos.cadastre_id 
        INNER JOIN candidate_programs AS prog 
        ON prog.id = pos.program_id
        INNER JOIN candidate_programs AS prog_old
        ON prog_old.id = bef.program_id
        AND bef.program_id = pos.program_id
        WHERE date_part('day', pos.created_at) = #{current_day} 
        AND date_part('month', pos.created_at) = #{month} 
        AND date_part('year', pos.created_at) = #{year} 
        AND pos.zone = #{zone}
        AND pos.program_id = #{program}
        AND pos.position <> bef.position ORDER BY pos.program_id, pos.position
      SQL

      self.paginate_by_sql(query, page: page, per_page: per_page)
    }

  end
end
