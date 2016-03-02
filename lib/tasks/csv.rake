require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0
    CSV.foreach("lib/files/cadastre_address.csv", :col_sep => "#") do |row|

      @index += 1

      if row[1].to_s != "NULL"
        @address = Candidate::CadastreAddress.new({
          cadastre_id: row[1],
          unit_id: row[9],
          dominial_chain: row[4],
          type_occurrence: row[6],
          type_receipt: row[5],
          created_at: row[8],
          situation_id: row[7],
          regularization_type_id: row[0]
        })

        begin 
          @address.save
          #puts @address.inspect
          puts @index 
        rescue
          puts "#{@index}------------------------------------------------------------------------------------------------------------------"
        end
      else
        puts "#{@index} NULLLLLLLLLLLLLLLLLLLLl------------------------------------------------------------------------------------------------------------------"
      end

      @index += 1

    end
  end
end
