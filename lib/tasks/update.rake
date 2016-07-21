require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


     CSV.foreach("lib/files/listagem.csv", :col_sep => "#") do |row|


           @teste = Sefaz::Exemption.new(
           name: row[2],
           cpf: row[3].gsub('.','').gsub('-',''),
           city: row[4],
           address: row[5].strip,
           realty_number: row[6],
           realty_value: row[7],
           allotment_id: row[0],
           created_at: row[9],
           act_number: row[8].to_s == "NULL" ? nil :row[8],
           unitary: false,
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
