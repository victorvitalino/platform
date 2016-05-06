require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

    CSV.foreach("lib/files/processo.csv", :col_sep => "#") do |row|

           #staff = Person::Staff.find_by_code(row[3]).id rescue nil

           @model = Candidate::CadastreProcedural.new(
           cadastre_id: row[0],
           procedural_status_id: row[1],
           created_at: row[4],
           convocation_id: row[2],
           old_process: row[3],
           )


          @model.save!
          #puts @model.inspect
        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
