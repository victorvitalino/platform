require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0



     CSV.foreach("lib/files/procedural.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreSituation.new(
           cadastre_id: row[0],
           situation_status_id: 7,
           created_at: row[1]
           )

           #puts @teste.inspect
           @teste.save

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
