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



     CSV.foreach("lib/files/trocacpf.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreActivity.new(
           cadastre_id: row[3],
           staff_id: row[2],
           activity_status_id: 8,
           type_activity: 3,
           type_ocurrency: 1,
           status: true,
           observation: row[0],
           created_at: row[1]

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
