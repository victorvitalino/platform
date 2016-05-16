require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/habilitados.csv", :col_sep => "#") do |row|

           #staff = Person::Staff.find_by_code(row[3]).id rescue nil


           @model = Candidate::CadastreSituation.new(
           cadastre_id: row[0],
           created_at: row[1],
           situation_status_id: 4,
           )

          #puts @model.inspect
          @model.save!

        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
