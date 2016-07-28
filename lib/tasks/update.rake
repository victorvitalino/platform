require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0



     CSV.foreach("lib/files/indicacao.csv", :col_sep => "#") do |row|


           @teste = Indication::Cadastre.new(
           cadastre_id: row[2],
           allotment_id: 64,
           program_id: row[5],
           pontuation_id: row[4],
           situation: 0,
           zone: 2,
           source_list: row[3],
           )
           @teste.save

           if @teste.present?

             @teste1 = Candidate::EnterpriseCadastre.new(
             enterprise_id: 22,
             cadastre_id: row[2],
             indication_cadastre_id:  @teste.id,
             zone: 2,
             source_list: row[3],
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
