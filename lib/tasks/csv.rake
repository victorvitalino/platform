require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0
    CSV.foreach("lib/files/cartorio.csv", :col_sep => "#") do |row|

        @address = Address::NotaryOffice.new({
          unit_code: row[1],
          office:  row[2],
          date_code: row[3],
          date_contract: row[4],
          code_contract: row[5],
          date_petition: row[6],
          date_signature: row[7],
          date_anoreg: row[8],
          date_devolution: row[9],
          requeriment: row[10],
          date_requeriment: row[11],
          declaratory_act_number: row[12],
          rejection_number: row[14],
          unit_id: row[16],
          date_act_declaratory: (row[12].to_s != 'NULL') ? row[13] : "",
          date_act_rejection: (row[14].to_s != 'NULL') ? row[13] : "",
          office_contract: row[15],
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
