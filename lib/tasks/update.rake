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



     CSV.foreach("lib/files/address.csv", :col_sep => "#") do |row|


           @teste = Candidate::CadastreAddress.new(
           cadastre_id: row[1],
           unit_id: row[3],
           dominial_chain: 0,
           type_receipt: 0,
           situation_id: 1,
           created_at: row[2]
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
