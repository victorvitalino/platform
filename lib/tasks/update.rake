require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

    CSV.foreach("lib/files/iptu.csv", :col_sep => "#") do |row|


           @model = Candidate::Iptu.new(
           registration: row[2],
           name: row[1],
           address: row[3],
           cpf: row[0].present? ? row[0].gsub('-','').gsub('.','') : "",
           city: row[4],
           kind_realty:row[5],
           kind_search:row[6],
           year:row[7],
           realty_codhab:  row[8],
           )


          begin
            @model.save
            #puts @model.inspect
          rescue
            puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          end


       puts  @index += 1

    end
  end

end
