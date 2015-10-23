require 'csv'

namespace :candidate do
  desc "Migração de assuntos"
  task :pontuation => :environment do
    @index = 0
   
    CSV.foreach("lib/files/pontuation_2014.csv", col_sep: "#") do |row|
      
      @pontuation = Candidate::Pontuation.new({
        cadastre_id: row[0],
        cadastre_mirror_id: row[0],
        total: row[1],
        bsb: row[2],
        dependent: row[3],
        timelist: row[4],
        special_condition: row[5],
        income: row[6],
        code: row[7],
        program_id: row[8],
        situation_status_id: 2
      })

      @pontuation.save      
    end
  end
end
