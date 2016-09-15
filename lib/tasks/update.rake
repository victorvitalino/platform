require 'csv'
require "open-uri"

namespace :update do

  task :zone => :environment do

    @allotments = Indication::Allotment.all

    @allotments.each do |item|

    end
  end

  desc "migração de log"
  task :firm => :environment do

    @index = 0



     CSV.foreach("lib/files/indicados14092016.csv", :col_sep => "#") do |row|


           @teste = Indication::Cadastre.new(
           cadastre_id: row[0],
           allotment_id: 70,
           program_id: row[3],
           pontuation_id: row[4],
           created_at: row[1],
           source_list: row[2],
           zone_id: 2

           )
           @teste.save

           @teste1 = Candidate::EnterpriseCadastre.new(
           cadastre_id: row[0],
           enterprise_id: 1,
           indication_cadastre_id: @teste.id,
           created_at: row[1],
           source_list: row[2],
           zone: 2
           )
           @teste1.save



           #puts @teste.inspect
          # puts @status.inspect

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
