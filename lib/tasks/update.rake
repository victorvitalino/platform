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



     CSV.foreach("lib/files/procedural_1.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreProcedural.new(
           cadastre_id: row[5],
           procedural_status_id: row[1],
           convocation_id: row[2],
           old_process: row[3],
           created_at: row[4]
           )
           @teste.save



           #puts @teste.inspect
          # puts @status.inspect

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
