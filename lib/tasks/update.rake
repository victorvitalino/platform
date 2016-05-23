require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/indi_cad.csv", :col_sep => "#") do |row|

           #staff = Person::Staff.find_by_code(row[3]).id rescue nil


           @model = Indication::Cadastre.new(
           allotment_id: row[2],
           cadastre_id: row[1],
           program_id: row[5],
           pontuation_id: row[4],
           zone: row[3],
           created_at: row[0],

           )

          #puts @model.inspect
          @model.save!

        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
