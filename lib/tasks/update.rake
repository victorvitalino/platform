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



     CSV.foreach("lib/files/log_ind.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreMirror.new(
           enterprise_cadastre_id: row[8],
           enterprise_cadastre_status_id: row[2],
           observation: row[3],
           file_path: row[4],
           created_at: row[1],
           firm_user_id: row[7]
           )
           @teste.save


          # puts @teste.inspect

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
