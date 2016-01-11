require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/sitpro_candidate_2.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::CadastreProcedural.new({
          cadastre_id: row[3],
          cadastre_mirror_id: row[3],
          procedural_status_id: row[0],
          convocation_id: row[2],
          old_process: row[1],
          created_at: row[4]
        })

        begin
          @ref.save
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end
end