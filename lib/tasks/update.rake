require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0



     CSV.foreach("lib/files/indicacao1.csv", :col_sep => "#") do |row|


           @teste = Indication::Cadastre.new(
           allotment_id: 66,
           cadastre_id: row[0],
           program_id: row[4],
           pontuation_id: row[3],
           zone: 2,
           created_at: row[1],
           source_list: row[2],
           )
           @teste.save

           if @teste.present?

             @teste1 = Candidate::EnterpriseCadastre.new(
             enterprise_id: 22,
             cadastre_id: row[0],
             indication_cadastre_id: @teste.id,
             zone: 2,
             created_at: row[1],
             source_list: row[2],
             )
             @teste1.save

           end

           #puts @teste.inspect

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
