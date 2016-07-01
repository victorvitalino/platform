require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


     CSV.foreach("lib/files/address.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreAddress.new(
           cadastre_id: row[8],
           unit_id: row[11],
           dominial_chain: row[2],
           type_occurrence: row[3],
           type_receipt: row[4],
           created_at: row[5],
           situation_id: row[10],
           regularization_type_id: row[6],

           )

           #puts @teste.inspect
           @teste.save

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end



    #select cnpj from protocol_assessments where cnpj is not null and length(cnpj) = 13

  end
end
