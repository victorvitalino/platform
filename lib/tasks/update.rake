require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0



     CSV.foreach("lib/files/address.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreAddress.new(
           cadastre_id: row[0],
           unit_id: row[8],
           dominial_chain: row[1],
           type_occurrence: row[2],
           type_receipt: row[3],
           created_at: row[4].present? ? row[4] : row[7],
           situation_id: row[6].to_i,
           regularization_type_id: row[5],
           )

           #puts @teste.inspect
           @teste.save

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
