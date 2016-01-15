require 'csv'

namespace :csv do
  desc "migração csv"


  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/candidate_unit2.csv", :col_sep => "#") do |row|
      @index += 1

       @ref = Candidate::CadastreAddress.new({
          cadastre_id: row[1],
          cadastre_mirror_id: row[1],
          unit_id: row[9],
          dominial_chain: row[4],
          type_occurrence: row[5],
          observation: '',
          type_receipt: row[6],
          created_at: row[7].to_s == "NULL" ? row[7] : row[8]
        })

        begin
          @ref.save
         # puts @ref.inspect
          puts @index
        rescue Exception => e
          puts e
        end

    end
  end
end