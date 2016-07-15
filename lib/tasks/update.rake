require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


     CSV.foreach("lib/files/unit.csv", :col_sep => "#") do |row|


           @teste = Address::Unit.new(
           acron_block: row[0],
           block: row[1],
           acron_group: row[2],
           group: row[2],
           unit: row[3],
           cep_unit: row[4],
           area: row[6],
           complete_address: row[7],
           burgh: row[8],
           situation_unit_id: row[9],
           donate: row[10],
           city_id: row[11],
           project_enterprise_id: row[11].to_s == "810" ? 17 : nil,
           control_number: row[12]
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
