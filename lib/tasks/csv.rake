require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0
    CSV.foreach("lib/files/cadastre_addresses_novo.csv", :col_sep => "#") do |row|

        @address = Candidate::CadastreAddress.new({
          cadastre_id: row[1].to_i,
          unit_id:  row[7],
          dominial_chain: row[2],
          type_occurrence: row[3],
          type_receipt: row[4],
          created_at: row[5],
          situation_id: row[8],
          regularization_type_id: row[6]
        })

        begin 
          @address.save
          #puts @address.inspect
          puts @index 
        rescue
          puts "#{@index}------------------------------------------------------------------------------------------------------------------"
        end
     
      @index += 1

    end
  end
end
